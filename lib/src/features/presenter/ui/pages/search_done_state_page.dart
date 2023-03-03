import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/manga_container_grid_view.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/manga_info_search.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class SearchDoneStatePage extends StatelessWidget {
  final bool selectButton;
  final List<InfoComicModel> data;

  const SearchDoneStatePage(
      {super.key, required this.selectButton, required this.data});

  @override
  Widget build(BuildContext context) {
    var ratie = (MediaQuery.of(context).size.width / 800);

    return selectButton
        ? GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: ratie,
              crossAxisCount: 3,
              mainAxisSpacing: 6,
              crossAxisSpacing: 7,
            ),
            itemBuilder: (_, idx) => MangaContainerGridView(data: data[idx]),
            itemCount: data.length,
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (_, idx) => MangaInfoSearch(manga: data[idx]),
          );
  }
}
