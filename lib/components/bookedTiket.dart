import 'package:flutter/material.dart';
import 'package:tugas/components/bottom_nav_bar.dart';


class BookedSeatsScreen extends StatelessWidget {
  final List<int> bookedSeats;

  const BookedSeatsScreen({Key? key, required this.bookedSeats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Adjust the selected seats by adding 1 to each selected seat
    List<int> adjustedBookedSeats = bookedSeats.map((seat) => seat + 1).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Booked Seats'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Booked Seats:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              adjustedBookedSeats.isEmpty ? 'No seats booked' : adjustedBookedSeats.join(', '),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation based on index
        },
        bookedSeats: adjustedBookedSeats, // Pass the adjusted selected seats
        username: "", // Provide a value for the username parameter
      ),
    );
  }
}
