import 'package:manga_easy_advanced_search/src/data/models/manga_model.dart';

abstract class MangaRepository {
  Future<List<Mangas>> getManga();
}
