abstract class SearchHistoryRepository {
  Future<List<String>> readSearchHistory(List<String> searchHistory);
  Future<void> saveSearchHistory(String search, List<String> searchHistory, int maxHistoryQty);
  Future<void> removeSearchHistory(String search, List<String> searchHistory);
  Future<void> removeAllSearchHistory(List<String> searchHistory);
}
