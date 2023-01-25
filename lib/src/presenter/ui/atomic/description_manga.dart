import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';

class DescriptionManga extends StatelessWidget {
  final String description;
  const DescriptionManga({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: CoffeeText(
          text: description,
          typography: CoffeeTypography.body,
          maxLines: 7,
          overflow: TextOverflow.ellipsis),
    );
  }
}
