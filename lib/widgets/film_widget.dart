import 'package:flutter/material.dart';

class FilmCard extends StatelessWidget {
  final String image;
  const FilmCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
