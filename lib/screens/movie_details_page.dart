import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_4/provider/saved_provider.dart';
import 'package:task_4/theme/appcolors.dart';
import 'package:task_4/widgets/screenshots_widget.dart';

class MovieDetails extends StatefulWidget {
  final Map<String, Object> film;
  const MovieDetails({super.key, required this.film});

  @override
  State<MovieDetails> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MovieDetails> {
  void addToList() {
    final savedProvider = Provider.of<SavedProvider>(context, listen: false);

    savedProvider.addFilm(widget.film, context);
  }

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        title: Text(widget.film['title'] as String),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: '${widget.film['id']}',
              child: Container(
                height: imageSize,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      widget.film['imageUrl'] as String,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColors.background.withOpacity(1),
                      AppColors.background.withOpacity(0),
                    ], begin: Alignment.bottomCenter, end: Alignment.center),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                right: 16,
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.film['title'] as String,
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(widget.film['genre'] as String),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                          height: 4,
                          width: 4,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Text(widget.film['release'] as String),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(widget.film['time'] as String),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button,
                      foregroundColor: AppColors.background,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    label: const Text(
                      'WATCH TRAILER',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    icon: const Icon(Icons.play_arrow),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(widget.film['description'] as String),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Screenshots',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 40, top: 6),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (widget.film['shots'] as List<String>).length,
                  itemBuilder: (context, index) {
                    final shots = (widget.film['shots'] as List<String>)[index];
                    return Screenshot(image: shots);
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.button,
        onPressed: () {
          addToList();
        },
        child: const Icon(
          Icons.bookmark,
          color: AppColors.background,
        ),
      ),
    );
  }
}
