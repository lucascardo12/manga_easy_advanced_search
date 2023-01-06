import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class GetPopularGenderCase {
  final _list = ['açao', 'artes-marciais', 'comedia', 'drama', 'romance'];
  List<GenerosModel> call() {
    return _list
        .map((e) => GenerosModel.carregaGeneros(codigo: e).first)
        .toList();
  }
}
