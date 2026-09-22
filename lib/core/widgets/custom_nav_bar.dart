import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:movieapp/features/home/browse_tab/browse_screen.dart';
import 'package:movieapp/features/home/home_tab/home_screen.dart';
import 'package:movieapp/features/home/profile_tab/profile_screen.dart';
import 'package:movieapp/features/home/search_tab/search_screen.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});

  List<Widget> tabs = [
    HomeScreen(),
    BrowseScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Image.asset('assets/image/home.png')),
      ],
    );
  }
}
