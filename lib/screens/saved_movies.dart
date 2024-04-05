import 'package:flutter/material.dart';
import 'package:task_4/screens/movie_details_page.dart';
import 'package:task_4/widgets/film_widget.dart';

class SavedMovies extends StatefulWidget {
  final List<Map<String, Object>> savedFilms;
  final Function(Map<String, Object>) onRemove;
  const SavedMovies(
      {super.key, required this.savedFilms, required this.onRemove});

  @override
  State<SavedMovies> createState() => _SavedMoviesState();
}

class _SavedMoviesState extends State<SavedMovies> {
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
          itemCount: widget.savedFilms.length,
          itemBuilder: (context, index) {
            final film = widget.savedFilms[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MovieDetails(
                        film: film,
                        isSaved: true, // Оскільки ми вже в SavedMovies
                        onRemove: widget.onRemove,
                      ),
                    ));
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
