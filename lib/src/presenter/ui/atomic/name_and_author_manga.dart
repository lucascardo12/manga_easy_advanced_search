import 'package:coffee_cup/features/text/coffee_text.dart';
import 'package:flutter/material.dart';

class NameAndAuthorManga extends StatelessWidget {
  final String nameManga;
  final String nameAuthor;
  const NameAndAuthorManga(
      {super.key, required this.nameManga, required this.nameAuthor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoffeeText(
            text: nameManga,
            typography: CoffeeTypography.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
        nameAuthor.isEmpty
            ? const SizedBox()
            : CoffeeText(
                text: nameAuthor,
                typography: CoffeeTypography.body,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
