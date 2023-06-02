import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';

class SearchNotFoundStatePage extends StatelessWidget {
  const SearchNotFoundStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CoffeeImage.unicorn(
          AssetsUnicorn.sad,
          width: 125,
          height: 125,
        ),
        const SizedBox(height: 24),
        const CoffeeText(
          text: 'Não foi possivel encontrar o mangá',
        )
      ],
    );
  }
}
