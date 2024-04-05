import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_4/provider/saved_provider.dart';
import 'package:task_4/screens/movie_details_page.dart';
import 'package:task_4/theme/appcolors.dart';
import 'package:task_4/widgets/film_widget.dart';

class SavedMovies extends StatefulWidget {
  const SavedMovies({super.key});

  @override
  State<SavedMovies> createState() => _SavedMoviesState();
}

class _SavedMoviesState extends State<SavedMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<SavedProvider>(
          builder: (context, savedProvider, child) {
            final films = savedProvider.savedList;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 5,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: films.length,
              itemBuilder: (context, index) {
                final film = films[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetails(film: film),
                      ),
                    );
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: AppColors.background,
                          title: const Text(
                            'Delete Film',
                            style: TextStyle(color: AppColors.white),
                          ),
                          content: const Text(
                            'Are you sure want to remove the film from your list',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                savedProvider.removeFilm(film);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Hero(
                    tag: '${film['id']}',
                    child: FilmCard(
                      image: film['imageUrl'] as String,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
