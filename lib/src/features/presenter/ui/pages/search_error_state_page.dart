import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';

class SearchErrorStatePage extends StatelessWidget {
  final String message;
  const SearchErrorStatePage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CoffeeImage.unicorn(
          AssetsUnicorn.fire,
          width: 100,
          height: 100,
        ),
        CoffeeText(text: message)
      ],
    );
  }
}
