import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/apply_botton.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/category_select_sheet_botton.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class SeeMoreTextButton extends StatelessWidget {
  final MangaController ct;
  const SeeMoreTextButton({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showModalBottomSheet<void>(
            context: context,
            backgroundColor: ThemeService.of.backgroundColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const CoffeeText(
                        text: 'Selecionar gêneros',
                        typography: CoffeeTypography.title),
                    const SizedBox(height: 15),
                    Expanded(
                      flex: 4,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Wrap(
                            runSpacing: 4,
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 2,
                            children: GenerosModel.carregaGeneros()
                                .map(
                                  (e) => CategorySelectSheetBotton(
                                      gender: e,
                                      ct: ct.filterNotifier.value.genders),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    ApplyBottonn(
                      nameBotton: 'Aplicar',
                      ct: ct,
                    )
                  ],
                ),
              );
            });
      },
      icon:
          const CoffeeText(text: 'Ver mais', typography: CoffeeTypography.body),
      label: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
      ),
    );
  }
}
