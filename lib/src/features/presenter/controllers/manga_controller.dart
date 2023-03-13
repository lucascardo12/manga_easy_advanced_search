import 'package:flutter/material.dart';
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

  final ValueNotifier<SearchState> state = ValueNotifier(SearchInitialState());
  List<GenerosModel> popularGender = [];

  final TextEditingController searchController = TextEditingController();

  final ValueNotifier<int> filterActive = ValueNotifier(0);

  void init() {
    loadingPopularGenders();
  }

  @override
  void dispose() {
    super.dispose();
    state.dispose();
    popularGender.clear();
  }

  void loadingPopularGenders() {
    popularGender = getPopularGenderCase();
  }

  int activeFilters() {
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

  int totalItens = 0;
  int pag = 0;
  final int _carregarItens = 20;
  List<InfoComicModel> listScreen = [];

  void fetch() async {
    try {
      if (searchController.text.isNotEmpty) {
        mangaFilter.search = searchController.text;
      } else {
        mangaFilter.search = null;
      }

      state.value = SearchLoadingState();
      var result = await _mangaRepository.getManga(
        filter: mangaFilter,
        limit: _carregarItens,
        offset: pag,
      );

      bool incluiu = false;
      for (var i in result) {
        incluiu = true;
        listScreen.add(i);
      }
      if (incluiu == true) {
        totalItens = listScreen.length;
      }

      if (listScreen.isEmpty) {
        state.value = SearchNotfoundState(
          'Não encontramos mangá para sua pesquisa ou filtro, tente limpar os filtros.',
        );
        return;
      }
      state.value = SearchDoneState(listScreen);
      filterActive.value = activeFilters();
      notifyListeners();
    } catch (e) {
      state.value = SearchErrorState(e.toString());
    }
  }
}
