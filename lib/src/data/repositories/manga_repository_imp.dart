import 'package:manga_easy_advanced_search/src/data/datasources/manga_datasource.dart';
import 'package:manga_easy_advanced_search/src/data/dtos/manga_dto.dart';
import 'package:manga_easy_advanced_search/src/domain/entities/manga_filter_entity.dart';
import 'package:manga_easy_advanced_search/src/domain/repositories/manga_repository.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaRepositoryImp implements MangaRepository {
  final MangaDatasource _mangaDatasource;
  MangaRepositoryImp(this._mangaDatasource);

  @override
  Future<List<InfoComicModel>> getManga({
    required MangaFilterEntity filter,
    int limit = 100,
    int offset = 0,
  }) async {
    var result = await _mangaDatasource.list(
      filter: filter,
      limit: limit,
      offset: offset,
    );
    return result.data.map((e) => InfoComicModel.fromJson(e)).toList();
  }
}
