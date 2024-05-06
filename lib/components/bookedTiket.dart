import 'package:flutter/material.dart';
import 'package:tugas/components/listUsers.dart';
import 'package:tugas/screens/home.dart';

class BookedSeatsScreen extends StatelessWidget {
  final List<int> bookedSeats;

  const BookedSeatsScreen({Key? key, required this.bookedSeats}) : super(key: key);

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Booked Seats'),
      actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                
              },
            )
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
            bookedSeats.isEmpty ? 'No seats booked' : bookedSeats.join(', '),
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(username: listUsers.isNotEmpty ? listUsers.first["username"] : "username",selectedSeats: [],),
                ),
              ); // Navigate back to the previous screen (Home screen)
            },
            child: Text('Return to Home'),
          ),
        ],
      ),
    ),
  );
}
}
