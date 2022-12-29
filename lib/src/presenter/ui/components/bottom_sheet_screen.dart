import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/avaliation_select.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/organisms/category_mangas.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeService.of.backgroundColor,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CoffeeText(
                  text: 'Filtrar', typography: CoffeeTypography.title),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CoffeeText(
                    text: 'Gêneros', typography: CoffeeTypography.body),
                TextButton.icon(
                  onPressed: () {},
                  icon: const CoffeeText(
                      text: 'Ver mais', typography: CoffeeTypography.body),
                  label: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                  ),
                )
              ],
            ),
            const CategoryMangas(),
            const SizedBox(height: 15),
            const CoffeeText(
                text: 'Avaliação', typography: CoffeeTypography.body),
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
                    children: [
                      const CoffeeText(
                          text: 'Data', typography: CoffeeTypography.body),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const CoffeeText(
                              text: 'Selecionar',
                              typography: CoffeeTypography.body),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      CoffeeText(
                          text: 'Artista', typography: CoffeeTypography.body),
                      SizedBox(
                        height: 10,
                      ),
                      CoffeeField(
                        hintText: 'Nome do artista',
                        contentPadding: EdgeInsets.only(left: 15),
                      ),

                      // Container(
                      //     height: 40,
                      //     width: 150,
                      //     decoration: BoxDecoration(

                      //       borderRadius: BorderRadius.circular(20),
                      //     ),
                      //     child: const TextField(
                      //       decoration: InputDecoration(
                      //           contentPadding: EdgeInsets.symmetric(
                      //               horizontal: 15, vertical: 14.5),
                      //           border: InputBorder.none,
                      //           hintText: 'Nome do artista'),
                      //     ))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
