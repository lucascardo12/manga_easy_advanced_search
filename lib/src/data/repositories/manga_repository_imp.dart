import 'package:manga_easy_advanced_search/src/data/models/manga_model.dart';
import 'package:manga_easy_advanced_search/src/data/repositories/manga_repository.dart';
import 'package:manga_easy_advanced_search/src/data/service/client_service.dart';
import 'package:manga_easy_advanced_search/src/data/utils/api.utils.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaRepositoryImp implements MangaRepository {
  final ClientService _clientService;
  MangaRepositoryImp(this._clientService);

  @override
  Future<List<InfoComicModel>> getManga() async {
    await Future.delayed(const Duration(seconds: 3));
    var result = await _clientService.get(API.mangaList);
    var apireseult = ResultModel.fromJson(result.data);
    return apireseult.data.map((e) => InfoComicModel.fromJson(e)).toList();
  }
}
