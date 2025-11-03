/// Displays only the movies marked as favorites.

import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_tile.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Movie> favorites;
  final Function(Movie) onToggleFavorite;
  final Function(Movie) onShowDetail;

  FavoritesScreen({
    required this.favorites,
    required this.onToggleFavorite,
    required this.onShowDetail,
  });

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      // Show placeholder if no favorites.
      return Center(
        child: Text(
          'No favorite movies added yet.',
          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
        ),
      );
    }

    // List all favorite movies
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: favorites.length,
      itemBuilder: (context, index) => Card(
        margin: EdgeInsets.symmetric(vertical: 6),
        elevation: 2,
        child: MovieTile(
          movie: favorites[index],
          onFavorite: () => onToggleFavorite(favorites[index]),
          onTap: () => onShowDetail(favorites[index]),
        ),
      ),
    );
  }
}
