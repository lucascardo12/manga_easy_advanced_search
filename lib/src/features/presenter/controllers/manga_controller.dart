import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:manga_easy_advanced_search/src/features/domain/entities/manga_filter_entity.dart';
import 'package:manga_easy_advanced_search/src/features/domain/repositories/manga_repository.dart';
import 'package:manga_easy_advanced_search/src/features/domain/usecases/get_popular_genres_use_case.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/state/search_state.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/state/search_state_imp.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaController extends ChangeNotifier {
  final MangaRepository _mangaRepository;
  final GetPopularGenresUseCase getPopularGenderCase;

  MangaController(this._mangaRepository, this.getPopularGenderCase);

  MangaFilterEntity mangaFilter = MangaFilterEntity(genders: []);

  SearchState state = SearchInitialState();
  List<GenerosModel> popularGender = [];
  final PagingController<int, InfoComicModel> pagingController =
      PagingController(firstPageKey: 0);

  TextEditingController searchController = TextEditingController();

  void init() {
    pagingController.addStatusListener((status) {
      print('status: $status');
    });
    pagingController.addPageRequestListener(
      (pageKey) => fetch(pageKey),
    );
    loadingPopularGenders();
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

  void fetch(int pageKey) async {
    try {
      Helps.log('fetch : \n');
      if (searchController.text.isNotEmpty) {
        pagingController.refresh();
        mangaFilter.search = searchController.text;
      } else {
        mangaFilter.search = null;
      }
      state = SearchLoadingState();
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
    } catch (e) {
      pagingController.error = e;
      state = SearchErrorState(e.toString());
    }
    notifyListeners();
  }

  void clearFilter() {
    mangaFilter = MangaFilterEntity(genders: []);
    state = SearchInitialState();
    notifyListeners();
  }
}
