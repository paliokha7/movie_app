import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4/cubit/saved_cubit/saved_cubit.dart';
import 'package:task_4/data/model/movie_model.dart';
import 'package:task_4/screens/movie_details_page.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Saved Movies'),
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
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            sliver: BlocBuilder<SavedCubit, List<Movie>>(
              builder: (context, state) {
                final movies = state;
                return SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 5,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetails(
                              movie: movie,
                            ),
                          ),
                        );
                      },
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                'Delete Film',
                                style: TextStyle(),
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<SavedCubit>()
                                        .removeFilm(movie);
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
                        tag: '${movie.id}',
                        child: FilmCard(
                          image:
                              "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
