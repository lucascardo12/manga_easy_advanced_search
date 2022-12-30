import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/components/see_more_text_button.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/apply_botton.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/avaliation_select.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/category_mangas.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class IconBottomSheetScreen extends StatelessWidget {
  const IconBottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.menu_rounded),
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              builder: (BuildContext context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: CoffeeText(
                              text: 'Filtrar',
                              typography: CoffeeTypography.title),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CoffeeText(
                                text: 'Gêneros',
                                typography: CoffeeTypography.body),
                            SeeMoreTextButton(),
                          ],
                        ),
                        const CategoryMangas(nameCategory: 'Shounem'),
                        const SizedBox(height: 15),
                        const CoffeeText(
                            text: 'Avaliação',
                            typography: CoffeeTypography.body),
                        const SizedBox(height: 10),
                        const AvaliationSelect(),
                        const SizedBox(height: 10),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  CoffeeText(
                                      text: 'Data',
                                      typography: CoffeeTypography.body),
                                  SizedBox(height: 10),
                                  CoffeeButton(
                                    margin: EdgeInsets.all(0),
                                    padding: EdgeInsets.all(0),
                                    label: 'Selecionar',
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  CoffeeText(
                                      text: 'Artista',
                                      typography: CoffeeTypography.body),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CoffeeField(
                                    hintText: 'Nome do artista',
                                    contentPadding: EdgeInsets.only(left: 15),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const ApplyBottonn(nameBotton: 'Aplicar filtro')
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
