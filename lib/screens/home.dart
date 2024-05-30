import 'package:flutter/material.dart';
import 'package:tugas/components/allFilm.dart';
import 'package:tugas/components/bookedTiket.dart';
import 'package:tugas/components/bottom_nav_bar.dart';
import 'package:tugas/components/favorite.dart';
import 'package:tugas/data/listFilm.dart';
import 'package:tugas/screens/detail.dart';

class Home extends StatefulWidget {
  final String username;
  final List<int> selectedSeats;
  Home({Key? key, required this.username, required this.selectedSeats});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get jumlahTiket => 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Capt Cinema', 
          style: TextStyle(
            fontSize: 25, 
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              
            },
            ),
          
  PopupMenuButton(
  icon: Icon(Icons.more_vert),
  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
    PopupMenuItem(
      child: ListTile(
        leading: Icon(Icons.home),
        title: Text('Home'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home(username: widget.username, selectedSeats: widget.selectedSeats,)),
          );
        },
      ),
    ),
    PopupMenuItem(
      child: ListTile(
        leading: Icon(Icons.shopping_cart),
        title: Text('Tickets'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookedSeatsScreen(bookedSeats: widget.selectedSeats)),
          );
        },
      ),
    ),
    PopupMenuItem(
      child: ListTile(
        leading: Icon(Icons.favorite),
        title: Text('Favorite'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Favorite(favoriteMovies: [],)),
          );
        },
      ),
    ),
  ],
)

        ],
      ),
     body: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.black87,
                ),
                SizedBox(width: 6),
                Text(
                  '${widget.username}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
    ),
    Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Now Showing...",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            )
          ),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllFilm()),
            );
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            child: Row(
              children: [
                Text(
                  "Lihat Semua",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),

        ],
      ),
      ),
      
      Expanded(
        child: 
        ListView(
        scrollDirection: Axis.horizontal,
        children:[Padding(
          padding: EdgeInsets.all(50),
          child: Row(
            children: [
              ...listFilm.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            fit: BoxFit.cover,
                            '${e['gambar']}',
                            ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SizedBox(
                            width: 220,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                                return Detail(nama: '${e["nama"]}',);}));
                              },
                              child: Text(
                                '${e['nama']}',
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                ),
                            ),
                          ),
                        ),
                          SizedBox(
                          height: 8,
                        ),
                        Text('${e['genre']}'),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                );
              })
            ],
          ),
          ),
        ],
      )
      )
  ]
    ),
    bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 0, 
        onTap: (index) {
          
        },
        bookedSeats: widget.selectedSeats,
        username : "${widget.username}", 
      ),

    );
  }
}

                 
