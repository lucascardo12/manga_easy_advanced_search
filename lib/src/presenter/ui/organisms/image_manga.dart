import 'package:flutter/material.dart';

class ImageManga extends StatelessWidget {
  const ImageManga({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 125,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: NetworkImage(
                'https://th.bing.com/th/id/OIP.8RVFFbW8QsrVJ86NieQLngHaLj?pid=ImgDet&rs=1'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
