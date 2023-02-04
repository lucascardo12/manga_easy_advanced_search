import 'package:flutter/material.dart';

class SelectRanged extends StatefulWidget {
  const SelectRanged({super.key});

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
        max: 2023,
        divisions: DateTime.now().year - yearStart.toInt(),
        labels: RangeLabels(
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangeValues = values;
          });
        },
      ),
    );
  }
}
