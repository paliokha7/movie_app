import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4/data/model/movie_model.dart';

class SavedCubit extends Cubit<List<Movie>> {
  SavedCubit() : super([]);

  void addFilm(Movie movie) {
    bool isContain = state.any((item) => item.id == movie.id);

    if (!isContain) {
      emit([...state, movie]);
    }
  }

  void removeFilm(Movie movie) {
    emit(state.where((item) => item.id != movie.id).toList());
  }
}
