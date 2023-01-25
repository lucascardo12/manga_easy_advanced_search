import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/data/models/manga_model.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/atomic/description_manga.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/atomic/name_and_author_manga.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/atomic/genre_manga.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/atomic/image_manga.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaInfoSearch extends StatelessWidget {
  final Mangas data;
  const MangaInfoSearch({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          ImageManga(imageManga: data.thumb),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                NameAndAuthorManga(
                    nameManga: data.name, nameAuthor: data.autor),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children:
                          GenerosModel.carregaGeneros(codigo: data.generos)
                              .map(
                                (e) => GenreManga(gender: e),
                              )
                              .toList()),
                ),
                DescriptionManga(
                  description: data.sinopse,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
