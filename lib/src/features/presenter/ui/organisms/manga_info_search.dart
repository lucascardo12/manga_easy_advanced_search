import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/atomic/description_manga.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/atomic/name_and_author_manga.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/atomic/genre_manga.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/atomic/image_manga.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaInfoSearch extends StatelessWidget {
  final InfoComicModel manga;

  const MangaInfoSearch({super.key, required this.manga});

  @override
  Widget build(BuildContext context) {
    final generos = manga.generos.split('<>').toList();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          ImageManga(imageManga: manga.thumb),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                NameAndAuthorManga(
                    nameManga: manga.name, nameAuthor: manga.autor),
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: generos.length,
                    itemBuilder: (context, index) {
                      final indexGender = generos[index];
                      final genero =
                          GenerosModel.carregaGeneros(codigo: indexGender);
                      return genero.isNotEmpty
                          ? GenreManga(gender: genero.first)
                          : SizedBox(
                              height: 20,
                              child: Center(
                                child: CoffeeText(text: indexGender),
                              ),
                            );
                    },
                  ),
                ),
                DescriptionManga(
                  description: manga.sinopse,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
