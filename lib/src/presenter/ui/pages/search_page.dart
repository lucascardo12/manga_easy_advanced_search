import 'package:coffee_cup/features/fields/coffee_field.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/manga_info_search.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/text_field_widget.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class SearchPage extends StatelessWidget {
  static const route = '/advanced-search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.of.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: const [
                FieldTextWidget(),
                MangaInfoSearch(),
                MangaInfoSearch(),
                MangaInfoSearch(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
