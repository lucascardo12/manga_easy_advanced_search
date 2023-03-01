import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class CategorySelectSheetBotton extends StatefulWidget {
  final GenerosModel gender;
  final List<String> ct;
  const CategorySelectSheetBotton(
      {super.key, required this.gender, required this.ct});

  @override
  State<CategorySelectSheetBotton> createState() =>
      _CategorySelectSheetBottonState();
}

class _CategorySelectSheetBottonState extends State<CategorySelectSheetBotton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            widget.ct.contains(widget.gender.codigo)
                ? widget.ct.remove(widget.gender.codigo)
                : widget.ct.add(widget.gender.codigo);
          });
        },
        child: widget.ct.contains(widget.gender.codigo)
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: ThemeService.of.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: ThemeService.of.backgroundIcon,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CoffeeText(
                        text: widget.gender.titulo,
                        color: ThemeService.of.primaryText),
                    Icon(
                      Icons.check_rounded,
                      size: 14,
                      color: ThemeService.of.primaryText,
                    ),
                  ],
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: ThemeService.of.backgroundIcon,
                  ),
                ),
                child: CoffeeText(
                    text: widget.gender.titulo,
                    typography: CoffeeTypography.body)));
  }
}
