import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/category_select_sheet_botton.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/see_more_text_button.dart';

class SelectGenderBottonSheet extends StatelessWidget {
  final MangaController ct;
  const SelectGenderBottonSheet({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CoffeeText(
              text: 'Gêneros',
            ),
            SeeMoreTextButton(ct: ct)
          ],
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ct.getPopularGenderCase().length,
            itemBuilder: (context, index) {
              final gender = ct.getPopularGenderCase()[index];
              return CategorySelectSheetBotton(
                gender: gender,
                filterGenders: ct.mangaFilter.genders,
              );
            },
          ),
        )
      ],
    );
  }
}
