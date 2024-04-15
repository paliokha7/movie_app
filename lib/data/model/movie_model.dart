class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String backDropPath;
  final String overview;
  final String realeseDate;

  Movie(
      {required this.id,
      required this.posterPath,
      required this.backDropPath,
      required this.overview,
      required this.title,
      required this.realeseDate});

  factory Movie.parseJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      backDropPath: json['backdrop_path'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      realeseDate: json['release_date'],
    );
  }
}
