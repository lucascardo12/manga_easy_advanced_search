import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/components/bottom_sheet_screen.dart';

class FieldTextWidget extends StatelessWidget {
  const FieldTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return const BottomSheetScreen();
                });
          },
          child: const Icon(Icons.menu_rounded),
        )
      ],
    );
  }
}
