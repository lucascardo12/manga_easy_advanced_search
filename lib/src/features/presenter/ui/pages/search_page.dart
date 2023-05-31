import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/filter_botton_sheet.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/sliver_app_bar_search_and_filter.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/pages/search_done_state_page.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/pages/search_error_state_page.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/pages/search_initial_state_page.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/state/search_state_imp.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class SearchPage extends StatefulWidget {
  static const route = '/advanced-search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final MangaController _controller = GetIt.I();

  @override
  void initState() {
    super.initState();
    _controller.init();
    _controller.addListener(() {
      setState(() {});
    });
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
            _controller.savePref();
          });
        },
        backgroundColor: ThemeService.of.primaryColor,
        child: _controller.selectButton
            ? Icon(Icons.view_stream, color: ThemeService.of.primaryText)
            : Icon(Icons.apps, color: ThemeService.of.primaryText),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBarSearchAndFilter(ct: _controller),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _controller.activeFilters > 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CoffeeText(
                                text:
                                    'Você tem ${_controller.activeFilters} filtros ativos',
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: _controller.clearFilter,
                                child: Icon(Icons.clear,
                                    color: ThemeService.of.backgroundIcon),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    GestureDetector(
                      onTap: () => showModalBottomSheet<void>(
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
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: ThemeService.of.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: ThemeService.of.backgroundIcon,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CoffeeText(text: 'Filtro'),
                            const SizedBox(width: 3),
                            Icon(
                              Icons.filter_alt,
                              size: 14,
                              color: ThemeService.of.primaryText,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Builder(
              builder: (_) {
                final state = _controller.state;
                if (state is SearchDoneState) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SearchDoneStatePage(
                      ct: _controller,
                      selectButton: _controller.selectButton,
                      data: state.mangas,
                    ),
                  );
                }
                if (state is SearchInitialState) {
                  return const SliverToBoxAdapter(
                    child: SearchInitialStatePage(),
                  );
                }
                if (state is SearchErrorState) {
                  return const SliverToBoxAdapter(
                    child: SearchErrorStatePage(),
                  );
                }
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
