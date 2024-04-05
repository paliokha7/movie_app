import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_4/screens/movie_list.dart';
import 'package:task_4/screens/saved_movies.dart';
import 'package:task_4/theme/appcolors.dart';
import 'package:task_4/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Map<String, Object>> savedFilms = [];
  late List<Widget> tabs;

  void addFilmToSaved(Map<String, Object> film) {
    if (!savedFilms.any((savedFilm) => savedFilm['id'] == film['id'])) {
      setState(() {
        savedFilms.add(film);
      });
    }
  }

  void removeFilmFromSaved(Map<String, Object> film) {
    setState(() {
      savedFilms.removeWhere((savedFilm) => savedFilm['id'] == film['id']);
    });
  }

  int currentIndex = 0;

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabs = [
      MovieList(
        savedFilms: savedFilms,
        addFilmToSaved: addFilmToSaved,
        removeFilmFromSaved: removeFilmFromSaved,
      ),
      SavedMovies(
        savedFilms: savedFilms,
        onRemove: removeFilmFromSaved,
      ),
    ];
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.addListener(
      () {
        setState(
          () {
            currentIndex = tabController.index;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideBar(),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  title: currentIndex == 0
                      ? const Text('Movies List')
                      : const Text('Saved Movies'),
                  centerTitle: false,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: SizedBox(
                      height: kToolbarHeight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: const TextStyle(color: AppColors.white),
                            filled: true,
                            fillColor: AppColors.grey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(controller: tabController, children: tabs)),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
            child: BottomNavigationBar(
              elevation: 5,
              selectedItemColor: AppColors.button,
              unselectedItemColor: AppColors.white,
              backgroundColor: Colors.transparent,
              currentIndex: tabController.index,
              onTap: (index) {
                setState(() {
                  tabController.index = index;
                });
              },
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
              ],
            ),
          ),
        ));
  }
}
