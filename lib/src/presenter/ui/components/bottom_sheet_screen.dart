import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/horns_rating.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/avaliation_select.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/category_mangas.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Filtrar',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gêneros',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Text(
                    'Ver mais',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  label: const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.black, size: 13),
                )
              ],
            ),
            const CategoryMangas(),
            const SizedBox(height: 10),
            Text(
              'Avaliação',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            const AvaliationSelect(),
            Text(
              'Quantidade de capítulos',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Avaliação',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
