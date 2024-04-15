import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4/cubit/saved_cubit/saved_cubit.dart';
import 'package:task_4/cubit/theme_cubit.dart/theme_cubit.dart';
import 'package:task_4/screens/home_page.dart';
import 'package:task_4/theme/appcolors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SavedCubit()),
        BlocProvider(create: (context) => ThemeCubit())
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          if (state is ThemeChanged) {
            return MaterialApp(
              title: 'FilmFinder',
              theme: state.theme,
              home: const HomePage(),
            );
          } else {
            return MaterialApp(
              title: 'FilmFinder',
              theme: MyAppTheme.darkTheme,
              home: const HomePage(),
            );
          }
        },
      ),
    );
  }
}
