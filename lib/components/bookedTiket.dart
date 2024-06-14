import 'package:flutter/material.dart';
import 'package:tugas/components/bottom_nav_bar.dart';
import 'package:tugas/components/favorite.dart';
import 'package:tugas/screens/home.dart';


class BookedSeatsScreen extends StatelessWidget {
  final List<int> bookedSeats;

  const BookedSeatsScreen({Key? key, required this.bookedSeats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> adjustedBookedSeats = bookedSeats.map((seat) => seat + 1).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Booked Seats'),
        actions: [
          Tooltip(
               message: 'Search',
               child: IconButton(
                 icon: Icon(Icons.search),
                 onPressed: () {},
               ),
             ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pop(context); 
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(username: 'username', selectedSeats: []), 
                      ),
                    );
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Tickets'),
                  onTap: () {
                    Navigator.pop(context); 
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookedSeatsScreen(bookedSeats: []), 
                      ),
                    );
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Favorite'),
                  onTap: () {
                    Navigator.pop(context); 
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Favorite(favoriteMovies: []), 
                      ),
                    );
                  },
                ),
              ),
            ],
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
          
        },
        bookedSeats: adjustedBookedSeats, 
        username: "", 
      ),
    );
  }
}
