import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/components/icons_bottom_sheet_screen.dart';

class FieldTextSearch extends StatelessWidget {
  const FieldTextSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CoffeeSearchField(
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 6),
          child: IconBottomSheetScreen(),
        ),
      ),
    );
  }
}
