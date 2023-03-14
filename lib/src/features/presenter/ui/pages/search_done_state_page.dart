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
    return PagedSliverList<int, InfoComicModel>(
      pagingController: ct.pagingController,
      builderDelegate: PagedChildBuilderDelegate<InfoComicModel>(
        itemBuilder: (context, item, index) => MangaInfoSearch(
          manga: item,
        ),
      ),
    );
    // return widget.selectButton
    //     ? GridView.builder(
    //         physics: const BouncingScrollPhysics(),
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           childAspectRatio: ratie,
    //           crossAxisCount: 3,
    //           mainAxisSpacing: 6,
    //           crossAxisSpacing: 7,
    //         ),
    //         itemBuilder: (_, idx) {
    //           if (idx >= widget.data.length - 1) {
    //             widget.ct.pag += 20;
    //             widget.ct.fetch();
    //           }
    //           return MangaContainerGridView(data: widget.data[idx]);
    //         },
    //         itemCount: widget.data.length,
    //       )
    //     : NotificationListener<ScrollEndNotification>(
    //         onNotification: (scrollEnd) {
    //           final metrics = scrollEnd.metrics;
    //           print('At the top');
    //           if (metrics.atEdge) {
    //             bool isTop = metrics.pixels == 0;
    //             if (isTop) {
    //               print('At the top');
    //             }
    //           }
    //           return true;
    //         },
    //         child: SliverList(
    //           delegate: SliverChildBuilderDelegate(
    //             (context, index) {
    //               // if (index >= widget.data.length - 1) {
    //               //   widget.ct.pag += 20;
    //               //   widget.ct.fetch();
    //               // }
    //               return MangaInfoSearch(
    //                 manga: widget.data[index],
    //               );
    //             },
    //             childCount: widget.data.length,
    //           ),
    //         ),
    //       );
  }
}
