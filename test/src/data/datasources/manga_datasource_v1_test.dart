import 'package:flutter_test/flutter_test.dart';
import 'package:manga_easy_advanced_search/share/service/dio_service.dart';
import 'package:manga_easy_advanced_search/src/data/datasources/manga_datasource_v1.dart';
import 'package:manga_easy_advanced_search/src/domain/entities/manga_filter_entity.dart';

void main() {
  final data = MangaDatasourceV1(DioService());
  test('manga datasource v1 ...', () async {
    var result = await data.list(filter: MangaFilterEntity());
    print(result.toJson());
  });
}
