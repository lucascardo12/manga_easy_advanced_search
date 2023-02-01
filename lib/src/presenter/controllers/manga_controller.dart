import 'package:flutter/cupertino.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import '../../data/repositories/manga_repository.dart';

class MangaController {
  final MangaRepository _mangaRepository;
  MangaController(this._mangaRepository);

  final ValueNotifier<List<InfoComicModel>?> mangas =
      ValueNotifier<List<InfoComicModel>?>(null);

  fetch() async {
    mangas.value = await _mangaRepository.getManga();
  }
}
