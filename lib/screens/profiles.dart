import 'package:flutter/material.dart';
import 'package:proyek/components/bottom_nav_bar.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  ProfilePage({Key? key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Username: $username',
              style: TextStyle(fontSize: 24),
            ),
            // Add more profile information/widgets as needed
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 1, // Set the current index to indicate profile page
        onTap: (index) {
          // Handle navigation based on index
        },
        bookedSeats: [],
        username : "" // Pass an empty list or actual booked seats depending on your use case
      ),
    );
  }
}
