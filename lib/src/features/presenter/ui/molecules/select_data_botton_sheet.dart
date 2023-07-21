import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:advanced_search/src/features/presenter/ui/molecules/select_ranged.dart';

class SelectDataBottonSheet extends StatelessWidget {
  final MangaController ct;
  const SelectDataBottonSheet({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CoffeeText(text: 'Data', typography: CoffeeTypography.body),
          const SizedBox(height: 10),
          SelectRanged(
            ct: ct,
          )
        ],
      ),
    );
  }
}
