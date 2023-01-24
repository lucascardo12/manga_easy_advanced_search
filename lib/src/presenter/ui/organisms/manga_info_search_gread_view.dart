import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/manga_container_grid_view.dart';

class MangaInfoSearchGreadView extends StatelessWidget {
  const MangaInfoSearchGreadView({super.key});

  @override
  Widget build(BuildContext context) {
    var ratie = (MediaQuery.of(context).size.width / 800);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: ratie,
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 7),
        itemBuilder: (_, index) => const MangaContainerGridView(),
        itemCount: 20,
      ),
    );
  }
}
