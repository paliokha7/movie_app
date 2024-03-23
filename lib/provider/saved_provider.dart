import 'package:flutter/material.dart';

class SavedProvider extends ChangeNotifier {
  final List<Map<String, Object>> savedList = [];

  void addFilm(Map<String, Object> film, BuildContext context) {
    bool isContain = savedList.any((item) => item['id'] == film['id']);

    if (!isContain) {
      savedList.add(film);
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Film is already added'),
        ),
      );
    }
  }

  void removeFilm(Map<String, dynamic> film) {
    savedList.remove(film);
    notifyListeners();
  }
}
