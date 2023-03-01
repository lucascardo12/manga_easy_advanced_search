import 'package:coffee_cup/features/buttons/coffee_button.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/controllers/manga_controller.dart';

class ApplyBottonn extends StatelessWidget {
  final String nameBotton;
  final MangaController ct;
  const ApplyBottonn({super.key, required this.nameBotton, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: CoffeeButton(
          label: nameBotton,
          onPress: () {
            ct.fetch();
            Navigator.of(context).pop();
          }),
    );
  }
}
