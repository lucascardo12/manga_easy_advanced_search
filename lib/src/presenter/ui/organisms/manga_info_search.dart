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
          const ImageManga(
              imageManga:
                  'https://th.bing.com/th/id/OIP.8RVFFbW8QsrVJ86NieQLngHaLj?pid=ImgDet&rs=1'),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                const NameAndAuthorManga(
                    nameManga: 'One piece', nameAuthor: 'Echiiro Oda'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: GenerosModel.carregaGeneros()
                          .map(
                            (e) => GenreManga(gender: e),
                          )
                          .toList()),
                ),
                const DescriptionManga(
                  description:
                      'A floating action button (FAB) is a circular button that triggers the primary action in your apps UI. This page shows you how to add the FAB to your layout, customize some of its appearance, and respond to button taps.To learn more about how to design a floating action button into your app according to the Material Design Guidelines, also see Buttons: Floating Action Button.',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
