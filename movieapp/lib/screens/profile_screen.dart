/// Displays static user profile details including avatar photo and bio.

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName = 'John Doe';
  final String userEmail = 'john.doe@example.com';
  final String userBio =
      'Flutter developer passionate about mobile apps and movie exploration.';
  final String avatarImage = 'assets/avatar.png';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 70, backgroundImage: AssetImage(avatarImage)),
            SizedBox(height: 24),
            Text(
              userName,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              userEmail,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Text(
              userBio,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
