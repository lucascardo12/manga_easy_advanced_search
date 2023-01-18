import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';

class ImageManga extends StatelessWidget {
  final String imageManga;
  const ImageManga({super.key, required this.imageManga});

  @override
  Widget build(BuildContext context) {
    return CoffeeMangaCover(
      height: 200,
      width: 125,
      cover: imageManga,
    );
  }
}
