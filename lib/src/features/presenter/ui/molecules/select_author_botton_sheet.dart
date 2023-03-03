import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/select_data_botton_sheet.dart';

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
            hintText: 'Nome do Autor',
            height: 44,
            contentPadding: const EdgeInsets.only(left: 14),
          ),
        ],
      ),
    );
  }
}
