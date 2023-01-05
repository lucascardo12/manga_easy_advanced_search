import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/atomic/description_manga.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/atomic/name_and_author_manga.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/atomic/genre_manga.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/atomic/image_manga.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaInfoSearch extends StatelessWidget {
  const MangaInfoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          const ImageManga(),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                const NameAndAuthorManga(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: GenerosModel.carregaGeneros()
                          .map(
                            (e) => GenreManga(gender: e),
                          )
                          .toList()),
                ),
                const DescriptionManga()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
