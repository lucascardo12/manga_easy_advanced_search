import 'package:flutter_test/flutter_test.dart';
import 'package:manga_easy_advanced_search/share/service/dio_service.dart';
import 'package:manga_easy_advanced_search/src/data/datasources/manga_datasource_v1.dart';
import 'package:manga_easy_advanced_search/src/data/repositories/manga_repository_imp.dart';
import 'package:manga_easy_advanced_search/src/domain/entities/manga_filter_entity.dart';

void main() {
  final reposity = MangaRepositoryImp(MangaDatasourceV1(DioService()));
  test('manga repository imp ...', () async {
    var result = await reposity.getManga(filter: MangaFilterEntity());
    for (var element in result) {
      print(element.toJson());
    }
  });
}
