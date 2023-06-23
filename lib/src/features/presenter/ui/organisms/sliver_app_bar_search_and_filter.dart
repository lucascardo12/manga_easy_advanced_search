import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/advanced_search_field.dart';

class SliverAppBarSearchAndFilter extends StatelessWidget {
  final MangaController ct;
  const SliverAppBarSearchAndFilter({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AdvancedSearchField(
        maxHistoryQty: 5,
        textCt: ct.searchController,
        list: ct.searchHistory,
        onChanged: (value) => ct.mangaFilter.search = value,
        onEditingComplete: ct.searchFilter,
        onPressedSuffix: ct.clearText,
      ),

      // CoffeeSearchField(
      //   onEditingComplete: ct.searchFilter,
      //   controller: ct.searchController,
      //   showBackOnly: true,
      //   suffixIcon: Padding(
      //       padding: const EdgeInsets.only(right: 6),
      //       child: IconButton(
      //         icon: const Icon(Icons.clear),
      //         onPressed: ct.clearText,
      //       )),
      // ),
    );
  }
}
