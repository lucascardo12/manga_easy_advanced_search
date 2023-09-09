import 'package:coffee_cup/coffe_cup.dart';
import 'package:coffee_cup/features/fields/styles/field_text.dart';
import 'package:flutter/material.dart';
import 'package:advanced_search/src/features/presenter/controllers/manga_controller.dart';

class SelectAuthorBottonSheet extends StatelessWidget {
  final MangaController ct;
  const SelectAuthorBottonSheet({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CoffeeText(
            text: 'Autor',
          ),
          const SizedBox(
            height: 10,
          ),
          CoffeeField(
            onChanged: (e) => ct.mangaFilter.author = e,
            fieldText: FieldText(hintText: 'Nome do Autor'),
          ),
        ],
      ),
    );
  }
}
