import 'package:coffee_cup/coffe_cup.dart';
import 'package:coffee_cup/features/buttons/coffee_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/data/models/manga_model.dart';
import 'package:manga_easy_advanced_search/src/data/repositories/manga_repository_imp.dart';
import 'package:manga_easy_advanced_search/src/data/service/dio_service.dart';
import 'package:manga_easy_advanced_search/src/domain/usecases/popular_genders_use_case.dart';
import 'package:manga_easy_advanced_search/src/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/presenter/controllers/search_controller.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/manga_container_grid_view.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/manga_info_search.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/text_field_search.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class SearchPage extends StatefulWidget {
  static const route = '/advanced-search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool selectButton = false;
  final ct = GenderController(GetPopularGenderCase());
  final MangaController _controller =
      MangaController(MangaRepositoryImp(DioService()));

  @override
  void initState() {
    _controller.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ratie = (MediaQuery.of(context).size.width / 800);
    return Scaffold(
      backgroundColor: ThemeService.of.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: false,
              pinned: false,
              floating: true,
              title: FieldTextSearch(ct: ct),
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
            ),
            //
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CoffeeSwitchButton(
                    value: selectButton,
                    onChanged: (_) {
                      setState(() {
                        selectButton = !selectButton;
                      });
                    },
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: ValueListenableBuilder<List<InfoComicModel>?>(
              valueListenable: _controller.mangas,
              builder: (_, manga, __) {
                return manga != null
                    ? selectButton
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: ratie,
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 7),
                              itemBuilder: (_, idx) =>
                                  MangaContainerGridView(data: manga[idx]),
                              itemCount: manga.length,
                            ))
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: manga.length,
                            itemBuilder: (_, idx) =>
                                MangaInfoSearch(manga: manga[idx]),
                          )
                    : Container();
              },
            ))
          ],
        ),
      ),
    );
  }
}
