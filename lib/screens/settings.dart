import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4/cubit/theme_cubit.dart/theme_cubit.dart';
import 'package:task_4/theme/appcolors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Theme mode'),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                if (state is ThemeChanged) {
                  return Switch.adaptive(
                    value: state.theme == MyAppTheme.darkTheme,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
