import 'package:flutter/material.dart';
import 'package:task_4/data/model/movie_model.dart';
import 'package:task_4/screens/movie_details_page.dart';
import 'package:task_4/screens/saved_movies.dart';

class SavedMoviesNavigator extends StatelessWidget {
  const SavedMoviesNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == "/movie_details") {
          final movie = settings.arguments as Movie;
          return MaterialPageRoute(
            builder: (BuildContext context) => MovieDetails(movie: movie),
          );
        }
        return MaterialPageRoute(
          builder: (BuildContext context) => const SavedMovies(),
        );
      },
    );
  }
}
