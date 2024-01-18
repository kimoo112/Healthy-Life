import 'package:flutter/material.dart';
import 'app_colors.dart';

final arMainTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    textTheme: const TextTheme().copyWith(
      bodyLarge: const TextStyle(
        color: Colors.black,
        height: 1.4,
        fontFamily: 'Almarai',
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15,
        fontFamily: 'Alamrai',
      ),
      bodySmall: const TextStyle(
        fontSize: 14,
        color: Colors.white60,
        fontFamily: 'Alamrai',
      ),
      headlineMedium: const TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Alamrai'),
      titleMedium: const TextStyle(
        color: Colors.white,
        fontFamily: 'Alamrai',
        height: 1.4,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: const TextStyle(
        color: Colors.white,
        height: 1.4,
        fontFamily: 'Almarai',
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: const TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Alamrai'),
      labelMedium: const TextStyle(
          fontSize: 12, color: Color(0xFFFFECB3), fontFamily: 'Alamrai'),
      labelLarge: const TextStyle(
          fontSize: 12,
          color: Colors.white60,
          fontWeight: FontWeight.w400,
          fontFamily: 'Alamrai'),
    ),
    cardTheme: CardTheme(
        color: AppColors.cardColor,
        elevation: 0,
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));
