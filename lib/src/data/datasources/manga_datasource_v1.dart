import 'package:manga_easy_advanced_search/share/service/client_service.dart';
import 'package:manga_easy_advanced_search/share/utils/api.utils.dart';
import 'package:manga_easy_advanced_search/src/data/datasources/manga_datasource.dart';
import 'package:manga_easy_advanced_search/src/data/dtos/manga_dto.dart';
import 'package:manga_easy_advanced_search/src/domain/entities/manga_filter_entity.dart';

class MangaDatasourceV1 extends MangaDatasource {
  final ClientService _clientService;

  MangaDatasourceV1(this._clientService);
  @override
  Future<MangaDto> list({
    required MangaFilterEntity filter,
    int offset = 0,
    int limit = 100,
  }) async {
    var result = await _clientService.get('/v1/${API.mangaList}');
    return MangaDto.fromJson(result.data);
  }
}
