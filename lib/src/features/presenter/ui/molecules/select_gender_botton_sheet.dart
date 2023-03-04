import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/category_select_botton_sheet.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/see_more_text_button.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class SelectGenderBottonSheet extends StatefulWidget {
  final MangaController ct;
  const SelectGenderBottonSheet({super.key, required this.ct});

  @override
  State<SelectGenderBottonSheet> createState() =>
      _SelectGenderBottonSheetState();
}

class _SelectGenderBottonSheetState extends State<SelectGenderBottonSheet> {
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
            TextButton.icon(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: ThemeService.of.backgroundColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) => AllGenders(ct: widget.ct),
                ).then((value) {
                  setState(() {});
                });
              },
              icon: const CoffeeText(
                  text: 'Ver mais', typography: CoffeeTypography.body),
              label: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.ct.getPopularGenderCase().length,
            itemBuilder: (context, index) {
              final gender = widget.ct.getPopularGenderCase()[index];
              return CategorySelectBottonSheet(
                gender: gender,
                filterGenders: widget.ct.mangaFilter.genders,
              );
            },
          ),
        )
      ],
    );
  }
}
