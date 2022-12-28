import 'package:flutter/material.dart';

class CategoryMangas extends StatefulWidget {
  const CategoryMangas({super.key});

  @override
  State<CategoryMangas> createState() => _CategoryMangasState();
}

class _CategoryMangasState extends State<CategoryMangas> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelect = !isSelect;
        });
      },
      child: isSelect
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Text(
                'shounem',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'shounem',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.white),
                    ),
                    const WidgetSpan(
                      child: Icon(Icons.check_rounded,
                          size: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
