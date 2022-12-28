import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HornsRating extends StatelessWidget {
  final double hornClassification;
  final bool ignoreGesture;
  final double itemSize;
  const HornsRating(
      {super.key,
      this.hornClassification = 0,
      this.ignoreGesture = false,
      this.itemSize = 40.0});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        ignoreGestures: ignoreGesture,
        glow: false,
        initialRating: hornClassification,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemSize: itemSize,
        itemCount: 6,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, index) {
          switch (index) {
            case 1:
              return Image.asset('assets/chifre_verde.webp');
            case 2:
              return Image.asset('assets/chifre_azul.webp');
            case 3:
              return Image.asset('assets/chifre_roxa.webp');
            case 4:
              return Image.asset('assets/chifre_dourado.webp');
            case 5:
              return Image.asset('assets/chifre_vermelho.webp');

            default:
              return Image.asset('assets/chifre_cinza.webp');
          }
        },
        onRatingUpdate: (rating) {});
  }
}
