import 'package:flutter/material.dart';

class SelectYear extends StatelessWidget {
  SelectYear({super.key});

  final DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Selecione o ano"),
      content: SizedBox(
        width: 300,
        height: 300,
        child: YearPicker(
          firstDate: DateTime(DateTime.now().year - 50, 1),
          lastDate: DateTime(DateTime.now().year, 1),
          initialDate: DateTime.now(),
          selectedDate: _selectedDate,
          onChanged: (DateTime dateTime) {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
