import 'package:persistent_database/persistent_database.dart';
import 'package:manga_easy_advanced_search/src/features/domain/repositories/search_repository.dart';

class SearchHistoryRepositoryImp implements SearchHistoryRepository {
  final Preference _servicePrefs;

  SearchHistoryRepositoryImp(this._servicePrefs);

  @override
  Future<List<String>> readSearchHistory(List<String> searchHistory) async {
    return List.from(
        await _servicePrefs.get(keyPreferences: KeyPreferences.searchHistory));
  }

  @override
  Future<void> removeAllSearchHistory(List<String> searchHistory) async {
    searchHistory = [];
    await _servicePrefs.put(
        keyPreferences: KeyPreferences.searchHistory, value: searchHistory);
  }

  @override
  Future<void> removeSearchHistory(
      String search, List<String> searchHistory) async {
    searchHistory.removeWhere((e) => e == search);
    await _servicePrefs.put(
        keyPreferences: KeyPreferences.searchHistory, value: searchHistory);
  }

  @override
  Future<void> saveSearchHistory(
      String search, List<String> searchHistory) async {
    if (!searchHistory.contains(search) &&
        searchHistory.length < 5 &&
        search.isNotEmpty) {
      searchHistory.add(search);
    }
    await _servicePrefs.put(
        keyPreferences: KeyPreferences.searchHistory, value: searchHistory);
  }
}
