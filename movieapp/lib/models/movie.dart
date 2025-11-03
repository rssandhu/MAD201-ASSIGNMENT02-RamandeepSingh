/// MAD201-01 Assignment 3
/// Student Name: Ramandeep Singh
/// Student ID: A00194321
/// Movie model for Movie Explorer App.

/// Represents a movie with details and favorite status.
class Movie {
  final String title; // Movie title
  final String genre; // Genre of the movie
  final int year; // Release year
  final String description; // Brief movie description
  final String imagePath; // Asset path for poster image
  bool isFavorite; // Is the movie marked as favorite by user?

  Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.description,
    required this.imagePath,
    this.isFavorite = false,
  });

  /// Toggles favorite status for this movie.
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
