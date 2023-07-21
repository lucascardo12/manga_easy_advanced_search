import 'package:flutter/material.dart';
import 'package:advanced_search/src/features/domain/entities/manga_filter_entity.dart';
import 'package:advanced_search/src/features/presenter/controllers/manga_controller.dart';

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
    MangaFilterEntity filterEntity = widget.ct.mangaFilter;
    if (filterEntity.yearAt != null && filterEntity.yearFrom != null) {
      _currentRangeValues = RangeValues(
        filterEntity.yearFrom!.toDouble(),
        filterEntity.yearAt!.toDouble(),
      );
    } else {
      _currentRangeValues =
          RangeValues(yearStart, DateTime.now().year.toDouble());
    }

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
            widget.ct.mangaFilter.yearAt = values.end.toInt();
            widget.ct.mangaFilter.yearFrom = values.start.toInt();
            _currentRangeValues = values;
          });
        },
      ),
    );
  }
}
