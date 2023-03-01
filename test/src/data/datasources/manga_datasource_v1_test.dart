import 'package:flutter_test/flutter_test.dart';
import 'package:manga_easy_advanced_search/share/drivers/dio_driver.dart';
import 'package:manga_easy_advanced_search/src/features/data/datasources/manga_datasource_v1.dart';
import 'package:manga_easy_advanced_search/src/features/domain/entities/manga_filter_entity.dart';

void main() {
  final data = MangaDatasourceV1(DioDriver());
  test('manga datasource v1 ...', () async {
    var result = await data.list(filter: MangaFilterEntity(genders: []));
    print(result.toJson());
  });
}
