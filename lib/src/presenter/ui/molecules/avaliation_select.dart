import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/molecules/horns_rating.dart';

class AvaliationSelect extends StatefulWidget {
  const AvaliationSelect({super.key});

  @override
  State<AvaliationSelect> createState() => _AvaliationSelectState();
}

class _AvaliationSelectState extends State<AvaliationSelect> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const HornsRating(
              hornClassification: 5,
              ignoreGesture: true,
              itemSize: 25,
            ),
            const SizedBox(width: 10),
            const Text('ou maior'),
            Radio(
              activeColor: Colors.black,
              value: 1,
              groupValue: _value,
              onChanged: (int? value) {
                setState(() {
                  _value = value!;
                });
              },
            )
          ],
        ),
      ],
    );
  }
}
