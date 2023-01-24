import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';

class MangaContainerGridView extends StatelessWidget {
  const MangaContainerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: const [
        CoffeeMangaCover(
          cover:
              'https://th.bing.com/th/id/OIP.8RVFFbW8QsrVJ86NieQLngHaLj?pid=ImgDet&rs=1',
          height: 200,
          width: 130,
        ),
        CoffeeText(
          text: 'One Piece ',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
