import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/components/text_field_widget.dart';
import 'package:manga_easy_advanced_search/widgets/manga_info_search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            FieldTextWidget(),
            MangaInfoSearch(),
          ],
        ),
      ),
    );
  }
}
