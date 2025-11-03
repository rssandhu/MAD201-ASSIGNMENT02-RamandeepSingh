/// Static about page with basic information about the app.

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final String aboutText =
      'Movie Explorer App\n\nVersion 1.0\n\n'
      'This Flutter app allows users to browse movies, view details, '
      'mark favorites, and navigate easily with a bottom navigation bar '
      'and drawer menu.\n\nDeveloped by John Doe.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Text(
            aboutText,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
