import 'package:flutter/material.dart';
import 'package:tugas/components/bookedTiket.dart';
import 'package:tugas/screens/home.dart';
import 'package:tugas/screens/profiles.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<int> bookedSeats;
  final String username; // Add username parameter

  MyBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    required this.bookedSeats,
    required this.username, // Receive username data
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(username: username, selectedSeats: bookedSeats,),)
              );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookedSeatsScreen(bookedSeats: bookedSeats),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(username: username), // Pass username to ProfilePage
                ),
              );
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
