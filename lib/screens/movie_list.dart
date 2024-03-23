import 'package:flutter/material.dart';

import 'package:task_4/data/films.dart';
import 'package:task_4/screens/movie_details_page.dart';
import 'package:task_4/widgets/film_widget.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

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
                    builder: (_) => MovieDetails(film: film),
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
