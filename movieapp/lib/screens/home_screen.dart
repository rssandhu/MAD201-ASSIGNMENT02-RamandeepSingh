/// MAD201-01 Assignment 3
/// Student Name: John Doe
/// Student ID: 123456789
/// Home screen displaying scrollable list of movies.

import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_tile.dart';

/// Displays list of movies as scrollable list with cards.
class HomeScreen extends StatelessWidget {
  final List<Movie> movies; // List of all movies to show
  final Function(Movie) onToggleFavorite; // Callback to toggle favorites
  final Function(Movie) onShowDetail; // Callback to open detail screen

  HomeScreen({
    required this.movies,
    required this.onToggleFavorite,
    required this.onShowDetail,
  });

  @override
  Widget build(BuildContext context) {
    // Display movies in a vertically scrollable list
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 6),
          elevation: 3,
          child: MovieTile(
            movie: movie,
            onFavorite: () => onToggleFavorite(movie), // Toggle favorite
            onTap: () => onShowDetail(movie), // Show movie details
          ),
        );
      },
    );
  }
}
