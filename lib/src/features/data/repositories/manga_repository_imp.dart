import 'package:manga_easy_advanced_search/src/features/data/datasources/manga_datasource.dart';
import 'package:manga_easy_advanced_search/src/features/domain/entities/manga_filter_entity.dart';
import 'package:manga_easy_advanced_search/src/features/domain/repositories/manga_repository.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaRepositoryImp implements MangaRepository {
  final MangaDatasource _mangaDatasource;
  MangaRepositoryImp(this._mangaDatasource);

  @override
  Future<List<InfoComicModel>> getManga({
    required MangaFilterEntity filter,
    int? limit,
    int? offset,
  }) async {
    var result = await _mangaDatasource.list(
        filter: filter, limit: limit ?? 20, offset: offset ?? 0);
    return result.data.map((e) => InfoComicModel.fromJson(e)).toList();
  }

  @override
  Future<List<String>> getGenders(List<String> genders) async {
    return genders;
  }
}
