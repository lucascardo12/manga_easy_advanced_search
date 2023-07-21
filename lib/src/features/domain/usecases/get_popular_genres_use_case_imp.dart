import 'package:advanced_search/src/features/domain/usecases/get_popular_genres_use_case.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class GetPopularGenresUseCaseImp implements GetPopularGenresUseCase {
  final _list = ['açao', 'comedia', 'drama', 'romance', 'shounen'];

  @override
  List<GenerosModel> call() {
    return _list
        .map((e) => GenerosModel.carregaGeneros(codigo: e).first)
        .toList();
  }
}
