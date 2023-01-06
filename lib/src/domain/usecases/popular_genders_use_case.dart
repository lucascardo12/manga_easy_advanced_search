import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class GetPopularGenderCase {
  final _list = ['açao', 'comedia', 'drama', 'romance', 'shounen'];
  List<GenerosModel> call() {
    return _list
        .map((e) => GenerosModel.carregaGeneros(codigo: e).first)
        .toList();
  }
}
