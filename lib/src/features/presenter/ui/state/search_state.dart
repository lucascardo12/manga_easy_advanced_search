import 'package:manga_easy_sdk/manga_easy_sdk.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState(this.message);
}

class SearchNotfoundState extends SearchState {
  final String message;

  SearchNotfoundState(this.message);
}

class SearchDoneState extends SearchState {
  final List<InfoComicModel> mangas;

  SearchDoneState(this.mangas);
}
