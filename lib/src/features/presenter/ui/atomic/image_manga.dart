import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class ImageManga extends StatelessWidget {
  final String imageManga;
  const ImageManga({super.key, required this.imageManga});

  @override
  Widget build(BuildContext context) {
    return CoffeeMangaCover(
      filtraImg: true,
      height: 200,
      width: 125,
      cover: imageManga,
      headers: Global.header,
    );
  }
}
