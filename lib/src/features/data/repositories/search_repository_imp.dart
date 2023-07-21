import 'package:persistent_database/persistent_database.dart';
import 'package:advanced_search/src/features/domain/repositories/search_repository.dart';

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
      String search, List<String> searchHistory, int maxHistoryQty) async {
    if (!searchHistory.contains(search) && search.isNotEmpty) {
      searchHistory.add(search);
      if (searchHistory.length > maxHistoryQty) {
        removeSearchHistory(searchHistory[0], searchHistory);
      }
    }
    if (searchHistory.contains(search)) {
      searchHistory.removeWhere((e) => e == search);
      searchHistory.add(search);
    }
    await _servicePrefs.put(
        keyPreferences: KeyPreferences.searchHistory, value: searchHistory);
  }
}
