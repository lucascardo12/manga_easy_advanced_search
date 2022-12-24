import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/components/genre_widget.dart';
import 'package:manga_easy_advanced_search/components/image_manga.dart';

class MangaInfoSearch extends StatelessWidget {
  const MangaInfoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              Text(
                'One piece',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Text(
                'Echiiro Oda',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
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
                child: Text(
                  'A floating action button (FAB) is a circular button that triggers the primary action in your apps UI. This page shows you how to add the FAB to your layout, customize some of its appearance, and respond to button taps.To learn more about how to design a floating action button into your app according to the Material Design Guidelines, also see Buttons: Floating Action Button.',
                  style: TextStyle(fontSize: 16),
                  maxLines: 7,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
