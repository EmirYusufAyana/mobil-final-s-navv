import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/movie_model.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ..._buildBackground(context, movie),
          _buildMovieInformation(context),
        ],
      ),
    );
  }

  Positioned _buildMovieInformation(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.05),
        child: Column(
          children: [
            Text(
              movie.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              '${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            RatingBar.builder(
              initialRating: movie.stars,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              ignoreGestures: true,
              itemCount: 5,
              itemSize: 20,
              unratedColor: Colors.white,
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              onRatingUpdate: (rating) {},
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              maxLines: 8,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.75, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBackground(context, movie) {
    final size = MediaQuery.of(context).size;
    return [
      Container(
        height: double.infinity,
        color: Colors.indigo.shade900,
      ),
      Image.network(
        movie.imagePath,
        width: double.infinity,
        height: size.height * 0.5,
        fit: BoxFit.cover,
      ),
      Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.indigo.shade900,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.3, 0.5]),
          ),
        ),
      ),
    ];
  }
}
