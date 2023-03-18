import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_easy_advanced_search/src/features/data/datasources/manga_datasource.dart';
import 'package:manga_easy_advanced_search/src/features/data/datasources/manga_datasource_v1.dart';
import 'package:manga_easy_advanced_search/src/features/data/repositories/manga_repository_imp.dart';
import 'package:manga_easy_advanced_search/src/features/domain/mappers/mapper_manga.dart';
import 'package:manga_easy_advanced_search/src/features/domain/repositories/manga_repository.dart';
import 'package:manga_easy_advanced_search/src/features/domain/usecases/get_popular_genres_use_case.dart';
import 'package:manga_easy_advanced_search/src/features/domain/usecases/get_popular_genres_use_case_imp.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/pages/search_page.dart';
import 'package:manga_easy_routes/manga_easy_routes.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';

class AdvancedMicroApp extends MicroApp {
  GetIt getIt = GetIt.instance;
  @override
  Map<String, Widget> routers = {SearchPage.route: const SearchPage()};

  @override
  void registerDependencies() {
    //mappers
    getIt.registerFactory(() => MapperManga());
    //datasource
    getIt.registerFactory<MangaDatasource>(() => MangaDatasourceV1(getIt()));

    //repositories
    getIt.registerFactory<MangaRepository>(
      () => MangaRepositoryImp(getIt(), getIt()),
    );

    //usecases
    getIt.registerFactory<GetPopularGenresUseCase>(
        () => GetPopularGenresUseCaseImp());

    //controllers
    getIt.registerFactory<MangaController>(
      () => MangaController(getIt(), getIt()),
    );
  }
}
