import 'package:http/http.dart' as http;
import 'package:task_4/data/api/api_key.dart';
import 'package:task_4/data/model/movie_model.dart';
import 'dart:convert';

class TmdbService {
  final upComingApiUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
  final popularApiUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
  final topRatedApiUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey";

  Future<http.Response> fetchMovieTrailers(int movieId) {
    final trailerApiUrl =
        "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey";
    return http.get(Uri.parse(trailerApiUrl));
  }

  Future<List<Movie>> fetchUpComingMovies() async {
    final response = await http.get(Uri.parse(upComingApiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) => Movie.parseJson(movie)).toList();

      for (var movie in movies) {
        final trailerResponse = await fetchMovieTrailers(movie.id);
        if (trailerResponse.statusCode == 200) {
          final List<dynamic> trailers =
              json.decode(trailerResponse.body)['results'];
          if (trailers.isNotEmpty) {
            movie.trailerKey = trailers[0]['key'];
          }
        }
      }

      await Future.delayed(const Duration(seconds: 1));

      return movies;
    } else {
      throw Exception('Error to load movies');
    }
  }

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(Uri.parse(popularApiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) => Movie.parseJson(movie)).toList();

      for (var movie in movies) {
        final trailerResponse = await fetchMovieTrailers(movie.id);
        if (trailerResponse.statusCode == 200) {
          final List<dynamic> trailers =
              json.decode(trailerResponse.body)['results'];
          if (trailers.isNotEmpty) {
            movie.trailerKey = trailers[0]['key'];
          }
        }
      }

      await Future.delayed(const Duration(seconds: 1));

      return movies;
    } else {
      throw Exception('Error to load movies');
    }
  }

  Future<List<Movie>> fetchTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedApiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) => Movie.parseJson(movie)).toList();

      for (var movie in movies) {
        final trailerResponse = await fetchMovieTrailers(movie.id);
        if (trailerResponse.statusCode == 200) {
          final List<dynamic> trailers =
              json.decode(trailerResponse.body)['results'];
          if (trailers.isNotEmpty) {
            movie.trailerKey = trailers[0]['key'];
          }
        }
      }

      await Future.delayed(const Duration(seconds: 1));

      return movies;
    } else {
      throw Exception('Error to load movies');
    }
  }
}
