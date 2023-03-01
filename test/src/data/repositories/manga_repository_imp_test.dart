import 'package:flutter_test/flutter_test.dart';
import 'package:manga_easy_advanced_search/share/drivers/dio_driver.dart';
import 'package:manga_easy_advanced_search/src/features/data/datasources/manga_datasource_v1.dart';
import 'package:manga_easy_advanced_search/src/features/data/repositories/manga_repository_imp.dart';
import 'package:manga_easy_advanced_search/src/features/domain/entities/manga_filter_entity.dart';

void main() {
  final reposity = MangaRepositoryImp(MangaDatasourceV1(DioDriver()));
  test('manga repository imp ...', () async {
    var result =
        await reposity.getManga(filter: MangaFilterEntity(genders: []));
    for (var element in result) {
      print(element.toJson());
    }
  });
}
