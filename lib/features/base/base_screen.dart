import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../chat/views/chat_view.dart';
import '../excercies/views/excercies_view.dart';
import '../map/views/map_view.dart';
import '../profile/views/profile_view.dart';
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
    const ChatView(),
    const MapScreen(),
    const ProfileView(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      extendBody: true,
      body: screens[_selectedIndex],
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
              icon: const Icon(CupertinoIcons.chat_bubble_2),
              selectedColor: AppColors.cardColor
              // selectedColor: Colors.yellow,
              ),
          MoltenTab(
              icon: const Icon(CupertinoIcons.location_solid),
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
