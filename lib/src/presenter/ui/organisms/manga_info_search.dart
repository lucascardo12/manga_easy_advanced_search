import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/genre_widget.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/image_manga.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

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
                const CoffeeText(
                    text: 'One piece',
                    typography: CoffeeTypography.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const CoffeeText(
                    text: 'Echirro Oda',
                    typography: CoffeeTypography.body,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        GenreWidget(nameGenre: 'shounem'),
                        GenreWidget(nameGenre: 'Comedia'),
                        GenreWidget(nameGenre: 'Drama'),
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: CoffeeText(
                      text:
                          'A floating action button (FAB) is a circular button that triggers the primary action in your apps UI. This page shows you how to add the FAB to your layout, customize some of its appearance, and respond to button taps.To learn more about how to design a floating action button into your app according to the Material Design Guidelines, also see Buttons: Floating Action Button.',
                      typography: CoffeeTypography.body,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Text(
//                   'One piece',
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: Theme.of(context)
//                       .textTheme
//                       .headlineSmall!
//                       .copyWith(color: ThemeService.of.backgroundText),
//                 ),