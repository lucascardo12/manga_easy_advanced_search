import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class CategorySelectSheetBotton extends StatefulWidget {
  final GenerosModel nameCategory;
  const CategorySelectSheetBotton({super.key, required this.nameCategory});

  @override
  State<CategorySelectSheetBotton> createState() =>
      _CategorySelectSheetBottonState();
}

class _CategorySelectSheetBottonState extends State<CategorySelectSheetBotton> {
  bool isSelect = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelect = !isSelect;
        });
      },
      child: isSelect
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ThemeService.of.primaryText,
                ),
              ),
              child: CoffeeText(
                  text: widget.nameCategory.titulo,
                  typography: CoffeeTypography.body))
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: ThemeService.of.primaryColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ThemeService.of.backgroundText,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.nameCategory.titulo),
                  const Icon(
                    Icons.check_rounded,
                    size: 14,
                  ),
                ],
              ),
            ),
    );
  }
}
