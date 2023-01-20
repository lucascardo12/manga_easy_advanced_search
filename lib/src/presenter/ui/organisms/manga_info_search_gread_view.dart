import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/manga_container_grid_view.dart';

class MangaInfoSearchGreadView extends StatelessWidget {
  const MangaInfoSearchGreadView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisExtent: 229),
      itemBuilder: (_, index) => MangaContainerGridView(),
      itemCount: 20,
    );
  }
}
