import 'package:dio/dio.dart';
import 'package:manga_easy_advanced_search/src/data/service/client_service.dart';

class DioService extends ClientService {
  final dio = Dio(
    BaseOptions(baseUrl: 'http://test-catalog.lucas-cm.com.br'),
  );
  @override
  Future get(String path) async {
    return await dio.get(path);
  }
}
