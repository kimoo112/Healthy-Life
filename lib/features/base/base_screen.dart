import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy_food/features/excercies/views/excercies_view.dart';
import 'package:healthy_food/features/profile/views/profile_view.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

import '../../core/theme/app_colors.dart';
import '../favorite/views/favorite_view.dart';
import '../home/views/home_view.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  List screens = [
    const HomeView(),
    const FavoriteView(),
    const ExcerciesView(),
    const ProfileView(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[_selectedIndex],
      // backgroundColor: Colors.deepPurple[400],
      // you can use the molten bar in the scaffold's bottomNavigationBar
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        barColor: AppColors.scaffoldBackgroundColor,
        domeHeight: 25,
        domeCircleColor: const Color(0xFFFFECB3),
        onTabChange: (clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
              icon: const Icon(CupertinoIcons.home),
              selectedColor: AppColors.cardColor),
          MoltenTab(
              icon: const Icon(CupertinoIcons.heart_fill),
              selectedColor: AppColors.cardColor),
          MoltenTab(
              icon: const Icon(Icons.sports_gymnastics_outlined),
              selectedColor: AppColors.cardColor
              // selectedColor: Colors.yellow,
              ),
          MoltenTab(
              icon: const Icon(CupertinoIcons.person_alt),
              selectedColor: AppColors.cardColor
              // selectedColor: Colors.yellow,
              ),
        ],
      ),
    );
  }
}
