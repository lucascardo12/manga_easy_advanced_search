import 'package:flutter/cupertino.dart';
import 'package:manga_easy_advanced_search/src/data/models/manga_model.dart';
import '../../data/repositories/manga_repository.dart';

class MangaController {
  final MangaRepository _mangaRepository;
  MangaController(this._mangaRepository);

  final ValueNotifier<List<Mangas>?> mangas =
      ValueNotifier<List<Mangas>?>(null);

  fetch() async {
    mangas.value = await _mangaRepository.getManga();
  }
}
