import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class CategoryMangas extends StatefulWidget {
  final String nameCategory;
  const CategoryMangas({super.key, required this.nameCategory});

  @override
  State<CategoryMangas> createState() => _CategoryMangasState();
}

class _CategoryMangasState extends State<CategoryMangas> {
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ThemeService.of.primaryColor,
                ),
              ),
              child: CoffeeText(
                  text: widget.nameCategory, typography: CoffeeTypography.body))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: ThemeService.of.primaryColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ThemeService.of.backgroundText,
                ),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.nameCategory,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: ThemeService.of.primaryText),
                    ),
                    const WidgetSpan(
                      child: Icon(Icons.check_rounded, size: 15),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
