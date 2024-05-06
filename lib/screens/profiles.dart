import 'package:flutter/material.dart';
import 'package:tugas/components/bottom_nav_bar.dart';
import 'package:tugas/components/favorite.dart';
import 'package:tugas/components/setting.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  ProfilePage({Key? key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ElevatedButton(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(Icons.favorite),
                    ),
                    Text('Favorite')
                  ],),
                  onPressed: () {
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context){
                      return Favorite(favoriteMovies: [],);
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0                    
                  ), 
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ElevatedButton(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(Icons.settings),
                    ),
                    Text('Settings')
                  ],),
                onPressed: () {
                  Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context){
                      return Settings();
                    }));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0                    
                ), 
              )
            ),
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
