import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/controllers/search_controller.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/filter_search_select_button.dart';

class FieldTextSearch extends StatelessWidget {
  final GenderController ct;
  const FieldTextSearch({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(),
      child: CoffeeSearchField(),
    );
  }
}
