import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_easy_advanced_search/src/features/domain/entities/manga_filter_entity.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/sliver_app_bar_search_and_filter.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/pages/search_done_state_page.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/pages/search_error_state_page.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/pages/search_initial_state_page.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/pages/search_not_found_state_page.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/state/search_state.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/state/search_state_imp.dart';
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
            SliverAppBarSearchAndFilter(ct: _controller),
            SliverToBoxAdapter(
              child: ValueListenableBuilder<int>(
                  valueListenable: _controller.filterActive,
                  builder: (_, active, __) {
                    return Visibility(
                      visible: _controller.activeFilters() > 0,
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CoffeeText(
                                  text: 'Você tem $active filtros ativos'),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  _controller.mangaFilter =
                                      MangaFilterEntity(genders: []);
                                  _controller.fetch();
                                },
                                child: Icon(Icons.clear,
                                    color: ThemeService.of.primaryColor),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ValueListenableBuilder<SearchState>(
                  valueListenable: _controller.state,
                  builder: (_, state, __) {
                    if (state is SearchDoneState) {
                      return SearchDoneStatePage(
                          selectButton: selectButton, data: state.mangas);
                    }
                    if (state is SearchInitialState) {
                      return const SearchInitialStatePage();
                    }

                    if (state is SearchNotfoundState) {
                      return SearchNotFoundStatePage(message: state.message);
                    }

                    if (state is SearchErrorState) {
                      return SearchErrorStatePage(message: state.message);
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
