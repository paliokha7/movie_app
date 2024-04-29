import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:task_4/cubit/saved_cubit/saved_cubit.dart';
import 'package:task_4/data/model/movie_model.dart';
import 'package:task_4/theme/appcolors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MovieDetails> with TickerProviderStateMixin {
  late YoutubePlayerController _controller;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.movie.trailerKey,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _colorAnimation = ColorTween(
      begin: AppColors.button,
      end: Colors.green,
    ).animate(_animationController);

    _positionAnimation = Tween<double>(
      begin: 0,
      end: -286,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.addListener(() {
      setState(() {});
    });
  }

  void showTrailer(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.all(10),
          backgroundColor: Colors.transparent,
          content: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () => debugPrint('Play'),
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: AppColors.button,
                  handleColor: AppColors.button,
                ),
              ),
              const PlaybackSpeedButton(),
              FullScreenButton(),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(fontSize: 13, color: AppColors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        title: Text(widget.movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: '${widget.movie.id}',
              child: Container(
                height: imageSize,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/original/${widget.movie.posterPath}",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColors.black.withOpacity(1),
                      AppColors.black.withOpacity(0),
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
                    widget.movie.title,
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text('Release date: ${widget.movie.realeseDate}  '),
                  const SizedBox(
                    height: 6,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.button,
                      foregroundColor: AppColors.black,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      showTrailer(context);
                    },
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
                  Text(widget.movie.overview),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_positionAnimation.value, 0),
            child: FloatingActionButton(
              backgroundColor: _colorAnimation.value,
              onPressed: () {
                setState(() {
                  _animationController.forward();
                  context.read<SavedCubit>().addFilm(widget.movie);
                });
              },
              child: const Icon(
                Icons.bookmark,
                color: AppColors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
