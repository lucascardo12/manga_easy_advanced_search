import 'package:flutter/material.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class GenreWidget extends StatelessWidget {
  final String nameGenre;
  const GenreWidget({super.key, required this.nameGenre});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 85,
      child: Row(children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
            child: Text(
          nameGenre,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: ThemeService.of.backgroundText),
        ))
      ]),
    );
  }
}
