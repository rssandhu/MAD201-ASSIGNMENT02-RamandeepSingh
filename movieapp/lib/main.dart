/// MAD201-01 Assignment 3
/// Student Name: Ramandeep Singh
/// Student ID: A00194321
/// Main entry point and root widget of the Movie Explorer app.

import 'package:flutter/material.dart';
import 'package:movieapp/screens/detail_screen.dart';
import 'screens/home_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'models/movie.dart';

void main() {
  runApp(MovieExplorerApp());
}

/// Root app widget with theme and home screen.
class MovieExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Explorer App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
          ), // replaces headline6
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: MainScaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Main scaffold with bottom navigation and drawer menu.
class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0; // Currently selected tab index

  // Sample movie data stored locally in the app
  final List<Movie> _movies = [
    Movie(
      title: 'Inception',
      genre: 'Sci-Fi',
      year: 2010,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with deskt',
      imagePath: 'assets/inception.png',
    ),
    Movie(
      title: 'Black Panthor',
      genre: 'Action',
      year: 2010,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with deskt',
      imagePath: 'assets/download1.jfif',
    ),
    Movie(
      title: 'Inception',
      genre: 'Sci-Fi',
      year: 2010,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with deskt',
      imagePath: 'assets/download2.jfif',
    ),
    // ... add more movies similarly
  ];

  /// Computes the list of favorite movies dynamically.
  List<Movie> get _favoriteMovies =>
      _movies.where((movie) => movie.isFavorite).toList();

  /// Toggles the favorite state of the given movie and refreshes UI.
  void _toggleFavorite(Movie movie) {
    setState(() {
      movie.toggleFavorite();
    });
  }

  /// Opens the detail screen for the selected movie.
  void _showDetail(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          movie: movie,
          onToggleFavorite: () {
            setState(() {
              movie.toggleFavorite();
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine which screen to show based on selected tab
    Widget bodyContent;
    switch (_selectedIndex) {
      case 0:
        bodyContent = HomeScreen(
          movies: _movies,
          onToggleFavorite: _toggleFavorite,
          onShowDetail: _showDetail,
        );
        break;
      case 1:
        bodyContent = FavoritesScreen(
          favorites: _favoriteMovies,
          onToggleFavorite: _toggleFavorite,
          onShowDetail: _showDetail,
        );
        break;
      case 2:
        bodyContent = ProfileScreen();
        break;
      default:
        bodyContent = HomeScreen(
          movies: _movies,
          onToggleFavorite: _toggleFavorite,
          onShowDetail: _showDetail,
        );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Movie Explorer')),
      // Navigation drawer accessible from app bar
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Center(
                child: Text(
                  'Movie Explorer',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            // Drawer options for navigation
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() => _selectedIndex = 0);
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: bodyContent,
      // Bottom navigation bar for tab switching
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int idx) => setState(() => _selectedIndex = idx),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
