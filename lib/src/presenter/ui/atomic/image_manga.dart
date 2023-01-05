import 'package:flutter/material.dart';

class ImageManga extends StatelessWidget {
  final String imageManga;
  const ImageManga({super.key, required this.imageManga});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 125,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                imageManga),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
