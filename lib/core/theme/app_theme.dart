import 'package:flutter/material.dart';
import 'package:healthy_food/core/theme/app_colors.dart';

final mainTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    textTheme: const TextTheme().copyWith(
      bodyLarge: const TextStyle(
        color: Colors.black,
        height: 1.4,
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15,
        fontFamily: 'Poppins',
      ),
      bodySmall: const TextStyle(
        fontSize: 14,
        color: Colors.white60,
        fontFamily: 'Poppins',
      ),
      headlineMedium: const TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
      titleMedium: const TextStyle(
          color: Colors.white,
          height: 1.4,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins'),
      titleLarge: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontFamily: 'Poppins'),
      displaySmall: const TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins'),
      labelMedium: const TextStyle(
          fontSize: 12, color: Color(0xFFFFECB3), fontFamily: 'Poppins'),
      labelLarge: const TextStyle(
          fontSize: 12,
          color: Colors.white60,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins'),
    ),
    cardTheme: CardTheme(
        color: AppColors.cardColor,
        elevation: 0,
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));
