import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/filter_botton_sheet.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class TextFieldSearch extends StatelessWidget {
  final MangaController ct;
  const TextFieldSearch({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return CoffeeSearchField(
      onChanged: (value) => ct.mangaFilter.search = value,
      onEditingComplete: ct.fetch,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 6),
        child: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
          color: ThemeService.of.backgroundIcon,
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              backgroundColor: ThemeService.of.backgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              builder: (BuildContext context) {
                return FilterBottonSheet(ct: ct);
              },
            );
          },
        ),
      ),
    );
  }
}
