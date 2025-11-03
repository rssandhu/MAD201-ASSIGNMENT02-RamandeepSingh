/// A reusable tile to display movie info in list.
///
/// Includes poster, title, genre/year and favorite toggle.

import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;
  final VoidCallback onFavorite;
  final VoidCallback onTap;

  MovieTile({
    required this.movie,
    required this.onFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          movie.imagePath,
          width: 60,
          height: 90,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(movie.title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('${movie.genre} • ${movie.year}'),
      trailing: IconButton(
        icon: Icon(
          movie.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: movie.isFavorite ? Colors.red : Colors.grey,
        ),
        onPressed: onFavorite,
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    );
  }
}
