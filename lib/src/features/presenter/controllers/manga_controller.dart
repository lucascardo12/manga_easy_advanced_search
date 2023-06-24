import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:manga_easy_advanced_search/src/features/domain/entities/manga_filter_entity.dart';
import 'package:manga_easy_advanced_search/src/features/domain/repositories/manga_repository.dart';
import 'package:manga_easy_advanced_search/src/features/domain/repositories/search_repository.dart';
import 'package:manga_easy_advanced_search/src/features/domain/usecases/get_popular_genres_use_case.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/state/search_state.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/state/search_state_imp.dart';
import 'package:manga_easy_crashlytics_service/manga_easy_crashlytics_service.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:persistent_database/persistent_database.dart';

class MangaController extends ChangeNotifier {
  final SearchHistoryRepository _searchHistoryImp;
  final MangaRepository _mangaRepository;
  final Preference _servicePrefs;
  final GetPopularGenresUseCase getPopularGenderCase;
  final CrashlyticsService _crashlyticsService;

  MangaController(
    this._mangaRepository,
    this.getPopularGenderCase,
    this._searchHistoryImp,
    this._crashlyticsService,
    this._servicePrefs,
  );

  MangaFilterEntity mangaFilter = MangaFilterEntity(genders: []);

  SearchState state = SearchInitialState();
  List<GenerosModel> popularGender = [];
  final PagingController<int, InfoComicModel> pagingController =
      PagingController(firstPageKey: 0);

  TextEditingController searchController = TextEditingController();
  bool selectButton = false;
  List<String> searchHistory = [];

  void saveLayoutPref() async {
    selectButton = !selectButton;
    await _servicePrefs.put(
        keyPreferences: KeyPreferences.selectLayoutSearch, value: selectButton);
  }

  Future<bool> readLayoutPref() async {
    return await _servicePrefs.get<bool>(
        keyPreferences: KeyPreferences.selectLayoutSearch);
  }

  Future<void> saveSearchHistory(String search) async {
    await _searchHistoryImp.saveSearchHistory(search, searchHistory);
  }

  Future<void> removeSearchHistory(String search) async {
    await _searchHistoryImp.removeSearchHistory(search, searchHistory);
  }

  Future<void> removeAllSearchHistory() async {
    await _searchHistoryImp.removeAllSearchHistory(searchHistory);
  }

  Future<List<String>> readSearchHistory() async {
    return await _searchHistoryImp.readSearchHistory(searchHistory);
  }

  void init() async {
    pagingController.addPageRequestListener(_fetch);
    selectButton = await readLayoutPref();
    searchHistory = await readSearchHistory();
    loadingPopularGenders();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    popularGender.clear();
    pagingController.dispose();
  }

  void loadingPopularGenders() {
    popularGender = getPopularGenderCase();
  }

  int get activeFilters {
    var cont = 0;
    int genders = mangaFilter.genders.length;
    if (mangaFilter.author != null) {
      cont += 1;
    }
    if (mangaFilter.yearAt != null || mangaFilter.yearFrom != null) {
      cont += 1;
    }
    return cont + genders;
  }

  final int _pageSize = 20;

  void _fetch(int pageKey) async {
    try {
      if (searchController.text.trim().isNotEmpty || activeFilters > 0) {
        mangaFilter.search = searchController.text.trim();
        saveSearchHistory(mangaFilter.search!);
      } else {
        // se nao tiver texto, nao faz a pesquisa e retorna vazio
        mangaFilter.search = null;
        pagingController.appendLastPage([]);
        return;
      }

      state = SearchLoadingState();
      if (pageKey == 0) {
        notifyListeners();
      }
      var result = await _mangaRepository.getManga(
        filter: mangaFilter,
        limit: _pageSize,
        offset: pageKey,
      );

      final isLastPage = result.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(result);
      } else {
        final nextPageKey = pageKey + result.length;
        pagingController.appendPage(result, nextPageKey);
      }

      state = SearchDoneState([]);
    } on Exception catch (e, s) {
      _crashlyticsService.recordError(e: e, tag: 'AdvancedMicroapp', stack: s);
      pagingController.error = e;
      state = SearchErrorState(e.toString());
    }
    notifyListeners();
  }

  void searchFilter() {
    pagingController.refresh();
  }

  void clearFilter() {
    mangaFilter = MangaFilterEntity(
      genders: [],
      search: mangaFilter.search,
    );
    final search = mangaFilter.search ?? '';
    if (search.isEmpty) {
      state = SearchInitialState();
    } else {
      pagingController.refresh();
    }

    notifyListeners();
  }

  void clearText() {
    searchController.clear();
    if (activeFilters > 0) {
      pagingController.refresh();
    } else {
      state = SearchInitialState();
    }

    notifyListeners();
  }
}
