import 'package:coffee_cup/features/text/coffee_text.dart';
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
              color: ThemeService.of.primaryText),
        ),
        const SizedBox(width: 5),
        Expanded(
            child:
                CoffeeText(text: nameGenre, typography: CoffeeTypography.body))
      ]),
    );
  }
}
