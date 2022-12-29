import 'package:coffee_cup/features/buttons/coffee_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ApplyBottonn extends StatelessWidget {
  final String nameBotton;
  const ApplyBottonn({super.key, required this.nameBotton});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: CoffeeButton(
          label: nameBotton,
          onPress: () => Navigator.of(context).pop(),
          margin: const EdgeInsets.all(5),
        ),
      ),
    );
  }
}
