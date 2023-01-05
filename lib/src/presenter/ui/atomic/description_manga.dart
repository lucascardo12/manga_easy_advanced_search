import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';

class DescriptionManga extends StatelessWidget {
  const DescriptionManga({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 15),
      child: CoffeeText(
          text:
              'A floating action button (FAB) is a circular button that triggers the primary action in your apps UI. This page shows you how to add the FAB to your layout, customize some of its appearance, and respond to button taps.To learn more about how to design a floating action button into your app according to the Material Design Guidelines, also see Buttons: Floating Action Button.',
          typography: CoffeeTypography.body,
          maxLines: 8,
          overflow: TextOverflow.ellipsis),
    );
  }
}
