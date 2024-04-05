import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_4/provider/saved_provider.dart';
import 'package:task_4/screens/home_page.dart';
import 'package:task_4/theme/appcolors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SavedProvider(),
      child: MaterialApp(
        title: 'FilmFinder',
        theme: MyAppTheme.appTheme,
        home: const HomePage(),
      ),
    );
  }
}
