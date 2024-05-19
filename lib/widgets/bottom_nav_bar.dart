import 'package:flutter/material.dart';
import 'package:newsapp/article_screen.dart';
import 'package:newsapp/discover_screen.dart';
import 'package:newsapp/home_screen.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(left: 30),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                icon: Icon(Icons.home),
              ),
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, DiscoverScreen.routeName);
              },
              icon: Icon(Icons.search),
            ),
            label: 'Search'),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                //Navigator.pushNamed(context, ArticleScreen.routeName);
              },
              icon: Icon(Icons.person),
            ),
            label: "Profile"),
      ],
    );
  }
}
