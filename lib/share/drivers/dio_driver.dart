import 'package:dio/dio.dart';
import 'package:manga_easy_advanced_search/share/drivers/client_driver.dart';

class DioDriver extends ClientDriver<Response> {
  final dio = Dio();
  @override
  Future<Response> get(String path) async {
    return await dio.get(path);
  }
}
