import 'package:flutter/material.dart';
import 'package:advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:advanced_search/src/features/presenter/ui/molecules/advanced_search_field.dart';

class SliverAppBarSearchAndFilter extends StatelessWidget {
  final MangaController ct;
  const SliverAppBarSearchAndFilter({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AdvancedSearchField(
        maxHistoryQty: ct.maxHistoryQty,
        textCt: ct.searchController,
        list: ct.searchHistory,
        onChanged: (value) => ct.mangaFilter.search = value,
        onEditingComplete: ct.searchFilter,
        onPressedSuffix: ct.clearText,
        removeHistory: ct.removeSearchHistory,
        removeAllHistory: ct.removeAllSearchHistory,
      ),
    );
  }
}
