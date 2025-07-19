import 'package:flutter/material.dart';
import 'package:rfaye3/core/utils/app_colors.dart';

class AppThemes {
  static ThemeData getLightData() {
    return ThemeData(
      fontFamily: 'cairo',
      scaffoldBackgroundColor: AppColors.backgroundLight,

      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.backgroundLight,
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.black),
        displayMedium: TextStyle(color: Colors.black),
        displaySmall: TextStyle(color: Colors.black),
        headlineLarge: TextStyle(color: Colors.black),
        headlineMedium: TextStyle(color: Colors.black),
        headlineSmall: TextStyle(color: Colors.black),
        titleLarge: TextStyle(color: Colors.black),
        titleMedium: TextStyle(color: Colors.black),
        titleSmall: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
        labelLarge: TextStyle(color: Colors.black),
        labelMedium: TextStyle(color: Colors.black),
        labelSmall: TextStyle(color: Colors.black),
      ),

      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.secondaryColor,
        error: Colors.red,
        onError: Colors.red,
        surface: AppColors.productColor,
        onSurface: Colors.white,
      ),
    );
  }

  static ThemeData getDarkData() {
    return ThemeData(
      fontFamily: 'cairo',
      scaffoldBackgroundColor: AppColors.backgroundDark,

      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.backgroundDark,
      ),
      
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.white),
        headlineLarge: TextStyle(color: Colors.white),
        headlineMedium: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        labelLarge: TextStyle(color: Colors.white),
        labelMedium: TextStyle(color: Colors.white),
        labelSmall: TextStyle(color: Colors.white),
      ),

      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.secondaryColor,
        error: Colors.red,
        onError: Colors.red,
        surface: AppColors.productColorDark,
        onSurface: Colors.white,
      ),
    );
  }
}
