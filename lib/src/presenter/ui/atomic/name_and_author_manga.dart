import 'package:coffee_cup/features/text/coffee_text.dart';
import 'package:flutter/material.dart';

class NameAndAuthorManga extends StatelessWidget {
  const NameAndAuthorManga({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CoffeeText(
            text: 'One piece',
            typography: CoffeeTypography.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        CoffeeText(
            text: 'Echirro Oda',
            typography: CoffeeTypography.body,
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
