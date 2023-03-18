import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/manga_container_grid_view.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/manga_info_search.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class SearchDoneStatePage extends StatelessWidget {
  final bool selectButton;
  final List<InfoComicModel> data;
  final MangaController ct;

  const SearchDoneStatePage(
      {super.key,
      required this.selectButton,
      required this.data,
      required this.ct});

  @override
  Widget build(BuildContext context) {
    var ratie = (MediaQuery.of(context).size.width / 800);
    return selectButton
        ? PagedSliverGrid<int, InfoComicModel>(
            pagingController: ct.pagingController,
            builderDelegate: PagedChildBuilderDelegate<InfoComicModel>(
                itemBuilder: (context, item, index) =>
                    MangaContainerGridView(data: item)),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: ratie,
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 11,
            ),
          )
        : PagedSliverList<int, InfoComicModel>(
            pagingController: ct.pagingController,
            builderDelegate: PagedChildBuilderDelegate<InfoComicModel>(
              itemBuilder: (context, item, index) => MangaInfoSearch(
                manga: item,
              ),
            ),
          );
  }
}
