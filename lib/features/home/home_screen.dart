import 'package:flutter/material.dart';
import 'package:movieapp/core/app_colors.dart';
import 'package:movieapp/features/home/tabs/browse_tab/browse_tab.dart';
import 'package:movieapp/features/home/tabs/home_tab/home_tab.dart';
import 'package:movieapp/features/home/tabs/profile_tab/profile_tab.dart';

import 'package:movieapp/features/home/tabs/search_tab/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'homescreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), ProfileTab()];

  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: tabs[index],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomNavigationBar(
            currentIndex: index,
            onTap: (index) {
              setState(() {
                this.index = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.whiteColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: AppColors.grayColor,
            items: [
              BottomNavigationBarItem(
                label: '',
                activeIcon: Container(
                  child: Image.asset(
                    "assets/image/home.png",
                    color: AppColors.primaryColor,
                  ),
                ),
                icon: Image.asset('assets/image/home.png'),
              ),

              BottomNavigationBarItem(
                label: '',
                activeIcon: Container(
                  child: Image.asset(
                    "assets/image/saerch.png",
                    color: AppColors.primaryColor,
                  ),
                ),
                icon: Image.asset('assets/image/saerch.png'),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: Container(
                  child: Image.asset(
                    "assets/image/browse.png",
                    color: AppColors.primaryColor,
                  ),
                ),
                icon: Image.asset('assets/image/browse.png'),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: Container(
                  child: Image.asset(
                    "assets/image/Profiel.png",
                    color: AppColors.primaryColor,
                  ),
                ),
                icon: Image.asset('assets/image/Profiel.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
