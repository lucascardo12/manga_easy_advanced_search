import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/microapp/routes/external_routes.dart';
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
    final generos = manga.genres.split('<>').toList();
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        ExternalRoutes.migrate.url,
        arguments: {
          "nameManga": manga.name,
          "isUniqueId": true,
        },
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageManga(imageManga: manga.thumb),
            const SizedBox(width: 15),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width - 125 - 32 - 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  NameAndAuthorManga(
                    nameManga: manga.name,
                    nameAuthor: manga.author,
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: generos.length,
                      itemBuilder: (context, index) {
                        final indexGender = generos[index];
                        final genero = GenerosModel.carregaGeneros(
                          codigo: indexGender,
                        );
                        return genero.isNotEmpty
                            ? GenreManga(gender: genero.first)
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: CoffeeText(text: indexGender),
                                ),
                              );
                      },
                    ),
                  ),
                  DescriptionManga(
                    description: manga.synopsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
