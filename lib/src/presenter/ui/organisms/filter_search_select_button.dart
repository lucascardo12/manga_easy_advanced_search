import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/controllers/search_controller.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/select_ranged.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/see_more_text_button.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/apply_botton.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/category_select_sheet_botton.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class FilterSearchSelectButton extends StatelessWidget {
  final GenderController ct;
  const FilterSearchSelectButton({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: ThemeService.of.primaryColor,
          child: Icon(Icons.filter_alt_outlined,
              color: ThemeService.of.primaryText),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 16,
                      right: 16,
                      top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CoffeeText(
                          text: 'Filtrar', typography: CoffeeTypography.title),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CoffeeText(
                            text: 'Gêneros',
                          ),
                          SeeMoreTextButton(),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: ct
                              .getPopularGenderCase()
                              .map(
                                (e) =>
                                    CategorySelectSheetBotton(nameCategory: e),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const CoffeeText(
                        text: 'Avaliação',
                      ),
                      const SizedBox(height: 10),
                      CoffeeRating(
                        onRatingUpdate: (_) {},
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 68,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  CoffeeText(
                                      text: 'Data',
                                      typography: CoffeeTypography.body),
                                  SizedBox(height: 10),
                                  SelectRanged()
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: SizedBox(
                              height: 68,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  CoffeeText(
                                    text: 'Artista',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CoffeeField(
                                    hintText: 'Nome do artista',
                                    height: 44,
                                    contentPadding: EdgeInsets.only(left: 14),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const ApplyBottonn(
                        nameBotton: 'Aplicar filtro',
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
