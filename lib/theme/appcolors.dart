import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF141414);
  static const Color grey = Color(0xFF2C2C2C);
  static const Color white = Color(0xFFffffff);
  static const Color button = Color(0xFFE7C54D);
  static const Color red = Color(0xFFE7C54D);
}

class MyAppTheme {
  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.white),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.background,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(color: AppColors.white, fontSize: 22.0),
    ),
  );
}
