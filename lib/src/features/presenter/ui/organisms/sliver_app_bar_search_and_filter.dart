import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';

class SliverAppBarSearchAndFilter extends StatelessWidget {
  final MangaController ct;
  const SliverAppBarSearchAndFilter({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      leading: Container(),
      leadingWidth: 0.0,
      backgroundColor: Colors.transparent,
      title: CoffeeSearchField(
        onEditingComplete: ct.searchFilter,
        controller: ct.searchController,
        showBackOnly: true,
        suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 6),
            child: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: ct.clearText,
            )),
      ),
    );
  }
}
