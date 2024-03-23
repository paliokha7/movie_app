import 'package:flutter/material.dart';

class FilmCard extends StatelessWidget {
  final String image;
  const FilmCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
