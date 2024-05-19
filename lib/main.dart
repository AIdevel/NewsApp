import 'package:flutter/material.dart';

import 'article_screen.dart';
import 'discover_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App UI',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        DiscoverScreen.routeName: (context) => DiscoverScreen(),
        ArticleScreen.routeName: (context) => ArticleScreen(),
      },
    );
  }
}
