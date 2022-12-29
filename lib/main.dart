import 'package:flutter/material.dart';
import 'package:manga_easy_advanced_search/src/presenter/ui/pages/search_page.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeService().returnThemeData(),
      home: const SearchPage(),
    );
  }
}
