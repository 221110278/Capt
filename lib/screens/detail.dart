import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/components/bookedTiket.dart';
import 'package:tugas/components/favorite.dart';
import 'package:tugas/components/favoriteprovider.dart';
import 'package:tugas/components/pesan-tiket.dart';
import 'package:tugas/data/listFilm.dart';
import 'package:tugas/screens/home.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.nama}) : super(key: key);

  final String nama;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  double _rating = 0; 

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    bool isFavorite = favoriteProvider.favoriteMovies.contains(widget.nama);

    Map<String, dynamic> selectedFilm = listFilm.firstWhere((film) => film['nama'] == widget.nama);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedFilm['nama']),
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
                        builder: (context) => Favorite(favoriteMovies: [],),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Image.network(selectedFilm['gambar']),
                const SizedBox(height: 20),
                Text(
                  selectedFilm['nama'],
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 24,
                    );
                  }),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 200, 
                  child: Slider(
                    value: _rating,
                    min: 0,
                    max: 5,
                    divisions: 5,
                    onChanged: (value) {
                      setState(() {
                        _rating = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: 500,
                    child: Text(
                      selectedFilm['deskripsi'],
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Tiket(nama: widget.nama);
                    }));
                  },
                  child: const Text('Pesan Tiket'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (isFavorite) {
              favoriteProvider.removeFavorite(widget.nama);
            } else {
              favoriteProvider.addFavorite(widget.nama);
            }
          });
        },
        child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border_outlined),
      ),
    );
  }
}
