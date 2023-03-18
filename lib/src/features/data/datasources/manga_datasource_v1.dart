import 'package:client_driver/client_driver.dart';
import 'package:manga_easy_advanced_search/src/features/data/datasources/manga_datasource.dart';
import 'package:manga_easy_advanced_search/src/features/data/dtos/manga_dto.dart';
import 'package:manga_easy_advanced_search/src/features/domain/entities/manga_filter_entity.dart';

class MangaDatasourceV1 extends MangaDatasource {
  final DriverHttp _clientDriver;
  final String path = 'catalog';
  final String url = 'http://catalog.lucas-cm.com.br';
  final String version = 'v1';

  MangaDatasourceV1(this._clientDriver);
  @override
  Future<MangaDto> list({
    required MangaFilterEntity filter,
    int? offset,
    int? limit,
  }) async {
    var params = '';
    if (filter.search != null) {
      params += 'search=${filter.search}&';
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
    var result = await _clientDriver.get(
      path: '$url/$version/$path?limit=$limit&offset=$offset&$params',
    );
    return MangaDto.fromJson(result.data);
  }
}
