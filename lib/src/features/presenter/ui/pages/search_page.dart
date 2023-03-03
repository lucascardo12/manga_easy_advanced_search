import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/manga_container_grid_view.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/filter_botton_sheet.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/manga_info_search.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/text_field_search.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/state/search_state.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class SearchPage extends StatefulWidget {
  static const route = '/advanced-search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool selectButton = false;
  final MangaController _controller = GetIt.I();

  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
              floating: true,
              pinned: false,
              leading: Container(),
              leadingWidth: 0.0,
              backgroundColor: Colors.transparent,
              title: CoffeeSearchField(
                onEditingComplete: _controller.fetch,
                controller: _controller.searchController,
                showBackOnly: true,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    color: ThemeService.of.backgroundIcon,
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: ThemeService.of.backgroundColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        builder: (BuildContext context) {
                          return FilterBottonSheet(ct: _controller);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ValueListenableBuilder<SearchState>(
                  valueListenable: _controller.state,
                  builder: (_, state, __) {
                    if (state is SearchDoneState) {
                      return selectButton
                          ? GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: ratie,
                                crossAxisCount: 3,
                                mainAxisSpacing: 6,
                                crossAxisSpacing: 7,
                              ),
                              itemBuilder: (_, idx) => MangaContainerGridView(
                                  data: state.mangas[idx]),
                              itemCount: state.mangas.length,
                            )
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.mangas.length,
                              itemBuilder: (_, idx) =>
                                  MangaInfoSearch(manga: state.mangas[idx]),
                            );
                    }
                    if (state is SearchInitialState) {
                      return Column(
                        children: [
                          CoffeeImage.unicorn(
                            AssetsUnicorn.lendo,
                            width: 100,
                            height: 100,
                          ),
                          const CoffeeText(text: 'Tente pesquisar algo')
                        ],
                      );
                    }

                    if (state is SearchNotfoundState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CoffeeImage.unicorn(
                            AssetsUnicorn.sad,
                            width: 100,
                            height: 100,
                          ),
                          CoffeeText(text: state.message)
                        ],
                      );
                    }

                    if (state is SearchErrorState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CoffeeImage.unicorn(
                            AssetsUnicorn.fire,
                            width: 100,
                            height: 100,
                          ),
                          CoffeeText(text: state.message)
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
