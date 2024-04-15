import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_4/theme/appcolors.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial()) {
    loadTheme();
  }

  void toggleTheme({bool? isDarkMode}) async {
    final prefs = await SharedPreferences.getInstance();
    if (isDarkMode != null) {
      await prefs.setBool('isDarkMode', isDarkMode);
      emit(ThemeChanged(
          isDarkMode ? MyAppTheme.darkTheme : MyAppTheme.lightTheme));
    } else {
      final currentState = state;
      if (currentState is ThemeChanged) {
        emit(ThemeChanged(currentState.theme == MyAppTheme.darkTheme
            ? MyAppTheme.lightTheme
            : MyAppTheme.darkTheme));
        await prefs.setBool(
            'isDarkMode', currentState.theme == MyAppTheme.lightTheme);
      }
    }
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    toggleTheme(isDarkMode: isDarkMode);
  }
}
