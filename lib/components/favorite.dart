import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/components/favoriteprovider.dart';
import 'package:tugas/data/listFilm.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key, required this.favoriteMovies}) : super(key: key);

  final List<String> favoriteMovies;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Movies"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding around the ListView
        child: ListView.builder(
          itemCount: favoriteProvider.favoriteMovies.length,
          itemBuilder: (context, index) {
            String favoriteMovieName = favoriteProvider.favoriteMovies[index];
            Map<String, dynamic> favoriteMovie = listFilm.firstWhere(
              (film) => film['nama'] == favoriteMovieName,
            );

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0), // Add margin between cards
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(8.0), // Padding inside the ListTile
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    favoriteMovie['gambar'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  favoriteMovie['nama'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(favoriteMovie['genre']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    favoriteProvider.removeFavorite(favoriteMovieName);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
