import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/controllers/manga_controller.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/select_ranged.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/organisms/see_more_text_button.dart';
import 'package:manga_easy_advanced_search/src/features/presenter/ui/molecules/category_select_sheet_botton.dart';

class FilterBottonSheet extends StatelessWidget {
  final MangaController ct;
  const FilterBottonSheet({super.key, required this.ct});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CoffeeText(text: 'Filtrar', typography: CoffeeTypography.title),
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
          ),
          const SizedBox(height: 15),
          // const CoffeeText(
          //   text: 'Avaliação',
          // ),
          // const SizedBox(height: 10),
          // CoffeeRating(
          //   onRatingUpdate: (_) {},
          // ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CoffeeText(
                        text: 'Data', typography: CoffeeTypography.body),
                    const SizedBox(height: 10),
                    SelectRanged(
                      ct: ct,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CoffeeText(
                      text: 'Artista',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CoffeeField(
                      onChanged: (e) => ct.mangaFilter.author = e,
                      hintText: 'Nome do artista',
                      height: 44,
                      contentPadding: const EdgeInsets.only(left: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          CoffeeButton(
            label: 'Aplicar filtro',
            onPress: () {
              ct.fetch();
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
