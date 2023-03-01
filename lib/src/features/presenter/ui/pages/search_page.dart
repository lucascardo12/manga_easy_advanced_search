import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/manga_container_grid_view.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/manga_info_search.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/text_field_search.dart';
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
  late final MangaController _controller;

  @override
  void initState() {
    _controller = GetIt.I.get<MangaController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ratie = (MediaQuery.of(context).size.width / 800);
    return Scaffold(
      backgroundColor: ThemeService.of.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            selectButton = !selectButton;
          });
        },
        backgroundColor: ThemeService.of.primaryColor,
        child: selectButton
            ? Icon(Icons.view_stream, color: ThemeService.of.primaryText)
            : Icon(Icons.apps, color: ThemeService.of.primaryText),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: false,
              pinned: false,
              floating: true,
              title: TextFieldSearch(ct: _controller),
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
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
                                      mainAxisSpacing: 6,
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
