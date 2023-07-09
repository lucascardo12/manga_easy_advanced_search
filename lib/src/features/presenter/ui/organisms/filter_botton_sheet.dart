import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/select_author_botton_sheet.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/select_data_botton_sheet.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/select_gender_botton_sheet.dart';

class FilterBottonSheet extends StatefulWidget {
  final MangaController ct;
  const FilterBottonSheet({super.key, required this.ct});

  @override
  State<FilterBottonSheet> createState() => _FilterBottonSheetState();
}

class _FilterBottonSheetState extends State<FilterBottonSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const CoffeeText(
                  text: 'Filtrar', typography: CoffeeTypography.title),
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.ct.clearFilter();
                    });
                  },
                  icon: const Icon(Icons.replay_outlined)),
            ],
          ),
          SelectGenderBottonSheet(ct: widget.ct),
          const SizedBox(height: 15),
          Row(
            children: [
              SelectDataBottonSheet(ct: widget.ct),
              const SizedBox(width: 20),
              SelectAuthorBottonSheet(ct: widget.ct),
            ],
          ),
          const SizedBox(height: 10),
          CoffeeButton(
            label: 'Aplicar filtro',
            onPressed: () {
              widget.ct.searchFilter();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
