import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/manga_info_search.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/text_field_search.dart';
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
                FieldTextSearch(),
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
