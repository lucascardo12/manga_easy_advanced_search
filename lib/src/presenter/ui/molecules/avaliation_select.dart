import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/horns_rating.dart';

class AvaliationSelect extends StatelessWidget {
  const AvaliationSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        HornsRating(
          hornClassification: 5,
          ignoreGesture: true,
          itemSize: 25,
        ),
        SizedBox(width: 10),
        Text('ou maior')
      ],
      
    );
  }
}
