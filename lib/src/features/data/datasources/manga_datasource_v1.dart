import 'package:manga_easy_advanced_search/share/drivers/client_driver.dart';
import 'package:manga_easy_advanced_search/src/features/data/datasources/manga_datasource.dart';
import 'package:manga_easy_advanced_search/src/features/data/dtos/manga_dto.dart';
import 'package:manga_easy_advanced_search/src/features/domain/entities/manga_filter_entity.dart';

class MangaDatasourceV1 extends MangaDatasource {
  final ClientDriver _clientDriver;
  final String path = 'catalog';
  final String url = 'http://test-catalog.lucas-cm.com.br';
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
    var result = await _clientDriver.get(
      '$url/$version/$path?limit=$limit&offset=$offset&$params',
    );
    return MangaDto.fromJson(result.data);
  }
}
