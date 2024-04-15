import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF141414);
  static const Color grey = Color(0xFF2C2C2C);
  static const Color white = Color(0xFFffffff);
  static const Color button = Color(0xFFE7C54D);
  static const Color red = Color(0xFFE7C54D);
}

class MyAppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.white),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.black,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(color: AppColors.white, fontSize: 22.0),
    ),
    inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppColors.black,
        hintStyle: TextStyle(color: AppColors.white),
        labelStyle: TextStyle(color: AppColors.white),
        prefixIconColor: AppColors.white),
    iconTheme: const IconThemeData(color: AppColors.white),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.white,
      selectionColor: AppColors.grey,
      selectionHandleColor: AppColors.white,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.black),
      bodyMedium: TextStyle(color: AppColors.black),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.black),
      titleTextStyle: TextStyle(color: AppColors.black, fontSize: 22.0),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.grey),
      labelStyle: TextStyle(color: AppColors.black),
    ),
    iconTheme: const IconThemeData(color: AppColors.black),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.black,
      selectionColor: AppColors.grey,
      selectionHandleColor: AppColors.black,
    ),
  );
}
