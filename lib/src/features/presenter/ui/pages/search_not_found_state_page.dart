import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';

class SearchNotFoundStatePage extends StatelessWidget {
  final String message;
  const SearchNotFoundStatePage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CoffeeImage.unicorn(
          AssetsUnicorn.sad,
          width: 100,
          height: 100,
        ),
        CoffeeText(text: message)
      ],
    );
  }
}
