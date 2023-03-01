import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/domain/entities/manga_filter_entity.dart';
import 'package:manga_easy_advanced_search/src/domain/repositories/manga_repository.dart';
import 'package:manga_easy_advanced_search/src/domain/usecases/get_popular_genres_use_case.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaController {
  final MangaRepository _mangaRepository;
  final GetPopularGenresUseCase getPopularGenderCase;
  MangaController(this._mangaRepository, this.getPopularGenderCase) {
    fetch();
  }

  MangaFilterEntity mangaFilter = MangaFilterEntity(genders: []);

  final ValueNotifier<List<InfoComicModel>?> mangas =
      ValueNotifier<List<InfoComicModel>?>(null);

  ValueNotifier<MangaFilterEntity> filterNotifier =
      ValueNotifier<MangaFilterEntity>(MangaFilterEntity(genders: []));

  fetch() async {
    mangas.value = await _mangaRepository.getManga(filter: mangaFilter);
    filterNotifier.value = _mangaRepository.getGenders(filterNotifier.value.genders);
  }
}
