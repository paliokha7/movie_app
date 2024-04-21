import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_4/navigation/movie_list_navigation.dart';
import 'package:task_4/navigation/profile_navigation.dart';
import 'package:task_4/navigation/saved_navigation.dart';

import 'package:task_4/theme/appcolors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  late List<Widget> _screens;
  late List<GlobalKey<NavigatorState>> _navigatorKeys;

  @override
  void initState() {
    super.initState();
    _screens = [
      const MovieListNavigator(),
      const SavedMoviesNavigator(),
      const ProfileNavigator(),
    ];
    _navigatorKeys =
        List.generate(_screens.length, (index) => GlobalKey<NavigatorState>());
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
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
              child: Navigator(
                key: _navigatorKeys[index],
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    settings: routeSettings,
                    builder: (context) => _screens[index],
                  );
                },
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
