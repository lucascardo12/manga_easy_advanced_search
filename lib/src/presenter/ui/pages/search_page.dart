import 'package:coffee_cup/coffe_cup.dart';
import 'package:coffee_cup/features/buttons/coffee_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/domain/usecases/popular_genders_use_case.dart';
import 'package:manga_easy_advanced_search/src/presenter/controllers/search_controller.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/manga_info_search.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/text_field_search.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/manga_info_search_gread_view.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class SearchPage extends StatefulWidget {
  static const route = '/advanced-search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ct = SearchController(GetPopularGenderCase());

  bool selectButton = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.of.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FieldTextSearch(ct: ct),
            CoffeeSwitchButton(
                value: selectButton,
                onChanged: (_) {
                  setState(() {
                    selectButton = !selectButton;
                  });
                }),
            selectButton
                ? const MangaInfoSearch()
                : const Expanded(child: MangaInfoSearchGreadView()),
            CoffeeField(),
          ],
        ),
      ),
    );
  }
}
