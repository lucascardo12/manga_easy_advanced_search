import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/microapp/routes/external_routes.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class MangaContainerGridView extends StatelessWidget {
  final InfoComicModel data;
  const MangaContainerGridView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        ExternalRoutes.migrate.url,
        arguments: {
          "nameManga": data.name,
          "isUniqueId": true,
        },
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 5),
          CoffeeMangaCover(
            filtraImg: true,
            cover: data.thumb,
            height: 200,
            width: 125,
            headers: Global.header,
          ),
          SizedBox(
            height: 30,
            child: Center(
              child: CoffeeText(
                text: data.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
