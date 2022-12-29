import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/horns_rating.dart';

class AvaliationSelect extends StatefulWidget {
  const AvaliationSelect({super.key});

  @override
  State<AvaliationSelect> createState() => _AvaliationSelectState();
}

class _AvaliationSelectState extends State<AvaliationSelect> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            HornsRating(
              hornClassification: 0,
              itemSize: 30,
            ),
          ],
        ),
      ],
    );
  }
}
