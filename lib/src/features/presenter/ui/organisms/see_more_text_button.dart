import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:advanced_search/src/features/presenter/ui/molecules/category_select_botton_sheet.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class AllGenders extends StatelessWidget {
  final MangaController ct;
  const AllGenders({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 15),
          const Center(
            child: CoffeeText(
                text: 'Selecionar gêneros', typography: CoffeeTypography.title),
          ),
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
                      .map((e) => CategorySelectBottonSheet(
                            gender: e,
                            filterGenders: ct.mangaFilter.genders,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          CoffeeButton(
            label: 'Aplicar',
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
