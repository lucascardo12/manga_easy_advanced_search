import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';

class MangaContainerGridView extends StatelessWidget {
  const MangaContainerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: CoffeeMangaCover(
              cover:
                  'https://th.bing.com/th/id/OIP.8RVFFbW8QsrVJ86NieQLngHaLj?pid=ImgDet&rs=1',
              height: 180,
              width: 120,
            ),
          ),
          CoffeeText(
            text: 'One Piece ksdjkjsj klskdj klsdkjkjas lsakd sadasd',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
