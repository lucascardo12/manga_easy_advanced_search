import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/manga_container_grid_view.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/manga_info_search.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class SearchDoneStatePage extends StatefulWidget {
  final bool selectButton;
  final List<InfoComicModel> data;
  final MangaController ct;

  const SearchDoneStatePage(
      {super.key,
      required this.selectButton,
      required this.data,
      required this.ct});

  @override
  State<SearchDoneStatePage> createState() => _SearchDoneStatePageState();
}

class _SearchDoneStatePageState extends State<SearchDoneStatePage> {
  @override
  Widget build(BuildContext context) {
    var ratie = (MediaQuery.of(context).size.width / 800);

    return widget.selectButton
        ? GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: ratie,
              crossAxisCount: 3,
              mainAxisSpacing: 6,
              crossAxisSpacing: 7,
            ),
            itemBuilder: (_, idx) {
              if (idx >= widget.data.length - 1) {
                widget.ct.pag += 20;
                widget.ct.fetch();
              }
              return MangaContainerGridView(data: widget.data[idx]);
            },
            itemCount: widget.data.length,
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.data.length,
            itemBuilder: (_, idx) {
              if (idx >= widget.data.length - 1) {
                widget.ct.pag += 20;
                widget.ct.fetch();
              }
              return MangaInfoSearch(manga: widget.data[idx]);
            },
          );
  }
}
