import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/data/models/manga_model.dart';

class MangaContainerGridView extends StatelessWidget {
  final Mangas data;
  const MangaContainerGridView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        CoffeeMangaCover(
          cover: data.thumb,
          height: 200,
          width: 125,
        ),
        CoffeeText(
          text: data.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
