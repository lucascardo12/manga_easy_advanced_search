import 'package:advanced_search/src/features/domain/entities/manga_filter_entity.dart';
import 'package:advanced_search/src/features/domain/mappers/mapper_manga.dart';
import 'package:advanced_search/src/features/domain/repositories/manga_repository.dart';
import 'package:client_driver/client_driver.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaRepositoryImp implements MangaRepository {
  final MapperManga _mapperManga;
  final ClientRequest _clientDriver;
  final ApiResponseParser _apiResponseParser;

  MangaRepositoryImp(
    this._mapperManga,
    this._clientDriver,
    this._apiResponseParser,
  );
  final String url = AppUrl.catalog;
  final String version = 'v1';
  final String path = 'catalog';

  @override
  Future<List<InfoComicModel>> getManga({
    required MangaFilterEntity filter,
    int? offset,
    int? limit,
  }) async {
    var params = '';
    if (filter.search != null) {
      params += 'search=${filter.search!.trim()}&';
    }
    if (filter.genders.isNotEmpty) {
      params += 'genders=${filter.genders.join('<>')}&';
    }

    if (filter.yearAt != null && filter.yearFrom != null) {
      params += 'yearFrom=${filter.yearFrom}&';
      params += 'yearAt=${filter.yearAt}&';
    }

    if (filter.author != null) {
      params += 'author=${filter.author}&';
    }
    if (Global.filterContentOver18) {
      params += 'isAdult=${Global.filterContentOver18}&';
    }
    var response = await _clientDriver.get(
      path: '$url/$version/$path?limit=$limit&offset=$offset&$params',
    );

    var result = _apiResponseParser.handleResponse(
        statusCode: response.statusCode, response: response.data);

    return result.data.map((e) => _mapperManga.from(e)).toList();
  }

  @override
  Future<List<String>> getGenders(List<String> genders) async {
    return genders;
  }
}
