import 'package:manga_easy_advanced_search/src/features/data/dtos/manga_dto.dart';
import 'package:manga_easy_advanced_search/src/features/domain/entities/manga_filter_entity.dart';

abstract class MangaDatasource {
  Future<MangaDto> list({
    required MangaFilterEntity filter,
    int? offset,
    int? limit,
  });
}
