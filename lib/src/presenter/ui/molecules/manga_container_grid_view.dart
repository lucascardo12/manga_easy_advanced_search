import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaContainerGridView extends StatelessWidget {
  final InfoComicModel data;
  const MangaContainerGridView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CoffeeMangaCover(
          cover: data.thumb,
          height: 200,
          width: 125,
        ),
        SizedBox(
          height: 30,
          child: Center(
            child: CoffeeText(
              text: data.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
