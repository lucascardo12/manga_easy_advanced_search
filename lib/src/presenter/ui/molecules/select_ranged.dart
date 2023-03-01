import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/controllers/manga_controller.dart';

class SelectRanged extends StatefulWidget {
  final MangaController ct;
  const SelectRanged({super.key, required this.ct});

  @override
  State<SelectRanged> createState() => _SelectRangedState();
}

class _SelectRangedState extends State<SelectRanged> {
  final double yearStart = 1985;

  late RangeValues _currentRangeValues;
  @override
  void initState() {
    _currentRangeValues =
        RangeValues(yearStart, DateTime.now().year.toDouble());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 450,
      child: RangeSlider(
        values: _currentRangeValues,
        min: yearStart,
        max: DateTime.now().year.toDouble(),
        divisions: DateTime.now().year - yearStart.toInt(),
        labels: RangeLabels(
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          setState(() {
            widget.ct.mangaFilter.yearAt = values.end.toInt() ;
            widget.ct.mangaFilter.yearFrom = values.start.toInt();
            _currentRangeValues = values;
          });
        },
      ),
    );
  }
}
