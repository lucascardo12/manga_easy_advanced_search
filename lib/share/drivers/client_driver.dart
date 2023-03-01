abstract class ClientDriver<T> {
  Future<T> get(String path);
}
