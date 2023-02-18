import 'package:manga_easy_advanced_search/src/domain/entities/manga_filter_entity.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

abstract class MangaRepository {
  Future<List<InfoComicModel>> getManga({
    required MangaFilterEntity filter,
    int limit,
    int offset,
  });
}
