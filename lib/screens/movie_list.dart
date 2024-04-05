import 'package:flutter/material.dart';

import 'package:task_4/data/films.dart';
import 'package:task_4/screens/movie_details_page.dart';
import 'package:task_4/widgets/film_widget.dart';

class MovieList extends StatelessWidget {
  final List<Map<String, Object>> savedFilms;
  final Function(Map<String, Object>) addFilmToSaved;
  final Function(Map<String, Object>) removeFilmFromSaved;
  const MovieList(
      {super.key,
      required this.savedFilms,
      required this.addFilmToSaved,
      required this.removeFilmFromSaved});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
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
                    builder: (_) => MovieDetails(
                      film: film,
                      isSaved: savedFilms.contains(film),
                      onSave: addFilmToSaved,
                      onRemove: removeFilmFromSaved,
                    ),
                  ),
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
        ),
      ),
    );
  }
}
