import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/controllers/search_controller.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/filter_search_select_button.dart';

class TextFieldSearch extends StatelessWidget {
  final GenderController ct;
  const TextFieldSearch({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(),
        child: CoffeeSearchField(
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 6),
            child: FilterSearchSelectButton(ct: ct),
          ),
        ));
  }
}
