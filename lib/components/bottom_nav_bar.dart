import 'package:flutter/material.dart';
import 'package:tugas/components/bookedTiket.dart';
import 'package:tugas/screens/home.dart';
import 'package:tugas/screens/profiles.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<int> bookedSeats;
  final String username;

  MyBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    required this.bookedSeats,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Tooltip(
            message: 'Home',
            child: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(username: username, selectedSeats: bookedSeats),
                  ),
                );
              },
            ),
          ),
          Tooltip(
            message: 'Tickets',
            child: IconButton(
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
          ),
          Tooltip(
            message: 'Profile',
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(username: username),
                  ),
                );
              },
              icon: Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }
}
