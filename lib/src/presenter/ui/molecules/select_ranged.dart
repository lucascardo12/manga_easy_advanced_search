import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SelectRanged extends StatefulWidget {
  const SelectRanged({super.key});

  @override
  State<SelectRanged> createState() => _SelectRangedState();
}

class _SelectRangedState extends State<SelectRanged> {
  RangeValues _currentRangeValues = RangeValues(1970, 2023);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 400,
      child: RangeSlider(
        values: _currentRangeValues,
        min: 1970,
        max: 2023,
        divisions: 53,
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
