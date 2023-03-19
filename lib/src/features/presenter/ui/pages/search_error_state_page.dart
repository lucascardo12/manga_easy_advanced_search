import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';

class SearchErrorStatePage extends StatelessWidget {
  const SearchErrorStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CoffeeImage.unicorn(
          AssetsUnicorn.fire,
          width: 125,
          height: 125,
        ),
        const CoffeeText(text: 'Aconteceu algum erro, tente novamente')
      ],
    );
  }
}
