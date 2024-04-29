import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:task_4/screens/movie_list.dart';
import 'package:task_4/screens/profile.dart';
import 'package:task_4/screens/saved_movies.dart';

import 'package:task_4/theme/appcolors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  int currentIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const MovieList(),
      const SavedMovies(),
      const Profile(),
    ];

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationController.forward(from: 0.0);
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      _animationController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: List.generate(
            _screens.length,
            (index) => Offstage(
              offstage: currentIndex != index,
              child: FadeTransition(
                opacity: _animationController.drive(
                  CurveTween(curve: Curves.easeInOut),
                ),
                child: _screens[index],
              ),
            ),
          ),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 100),
            child: BottomNavigationBar(
              elevation: 5,
              selectedItemColor: AppColors.button,
              unselectedItemColor: AppColors.white,
              backgroundColor: Colors.transparent,
              currentIndex: currentIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.bookmark,
                    ),
                    label: 'Saved'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                    ),
                    label: 'Profile'),
              ],
            ),
          ),
        ));
  }
}
