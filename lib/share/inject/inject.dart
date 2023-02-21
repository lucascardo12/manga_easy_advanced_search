// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_easy_advanced_search/manga_easy_advanced_search.dart';
import 'package:manga_easy_routes/manga_easy_routes.dart';

import 'package:manga_easy_advanced_search/share/service/client_service.dart';
import 'package:manga_easy_advanced_search/share/service/dio_service.dart';
import 'package:manga_easy_advanced_search/src/data/datasources/manga_datasource.dart';
import 'package:manga_easy_advanced_search/src/data/datasources/manga_datasource_v1.dart';
import 'package:manga_easy_advanced_search/src/data/repositories/manga_repository_imp.dart';
import 'package:manga_easy_advanced_search/src/domain/repositories/manga_repository.dart';
import 'package:manga_easy_advanced_search/src/domain/usecases/get_popular_genres_use_case.dart';
import 'package:manga_easy_advanced_search/src/domain/usecases/get_popular_genres_use_case_imp.dart';
import 'package:manga_easy_advanced_search/src/presenter/controllers/manga_controller.dart';

class Inject extends MicroApp {
  @override
  Map<String, Widget> routers = {SearchPage.route: const SearchPage()};

  @override
  void registerDependencies() {
    GetIt getIt = GetIt.instance;

    //service
    getIt.registerLazySingleton<ClientService>(() => DioService());

    //datasource
    getIt.registerLazySingleton<MangaDatasource>(
        () => MangaDatasourceV1(getIt()));

    //repositories
    getIt.registerLazySingleton<MangaRepository>(
        () => MangaRepositoryImp(getIt()));

    //usecases
    getIt.registerLazySingleton<GetPopularGenresUseCase>(
        () => GetPopularGenresUseCaseImp());

    //controllers
    getIt.registerLazySingleton<MangaController>(
      () => MangaController(getIt(), getIt()),
    );
  }
}
