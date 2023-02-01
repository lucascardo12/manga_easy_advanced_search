import 'package:manga_easy_advanced_search/src/data/models/manga_model.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

abstract class MangaRepository {
  Future<List<InfoComicModel>> getManga();
}
