import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task_4/data/api/api.dart';
import 'package:task_4/data/model/movie_model.dart';
import 'package:task_4/screens/movie_details_page.dart';
import 'package:task_4/widgets/film_widget.dart';
import 'package:task_4/widgets/film_widget_carousel.dart';
import 'package:task_4/widgets/shimmers/film_card_shimmer.dart';
import 'package:task_4/widgets/shimmers/film_carousle_shimmer.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late final TmdbService _tmdbService;

  @override
  void initState() {
    _tmdbService = TmdbService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<Movie>>(
                  future: _tmdbService.fetchUpComingMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (context, index, movieIndex) {
                          return const FilmCarouselShimmer();
                        },
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            autoPlayInterval: const Duration(seconds: 10)),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      final movies = snapshot.data!;

                      return CarouselSlider.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index, movieIndex) {
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
                            child: FilmCarousel(
                                image:
                                    "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                title: movie.title),
                          );
                        },
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            autoPlayInterval: const Duration(seconds: 10)),
                      );
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Popular Movies',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: FutureBuilder<List<Movie>>(
                      future: _tmdbService.fetchPopularMovies(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return const FilmCardShimmer();
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          final movies = snapshot.data!;

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                            itemBuilder: (
                              context,
                              index,
                            ) {
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
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Trended Movies',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: FutureBuilder<List<Movie>>(
                      future: _tmdbService.fetchTopRatedMovies(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return const FilmCardShimmer();
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          final movies = snapshot.data!;

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                            itemBuilder: (
                              context,
                              index,
                            ) {
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
                        }
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
