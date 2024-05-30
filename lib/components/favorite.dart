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
        padding: const EdgeInsets.all(0),
        child: ListView.builder(
          itemCount: favoriteProvider.favoriteMovies.length,
          itemBuilder: (context, index) {
            String favoriteMovieName = favoriteProvider.favoriteMovies[index];
            Map<String, dynamic> favoriteMovie = listFilm.firstWhere(
              (film) => film['nama'] == favoriteMovieName,
            );

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Image.network(
                        favoriteMovie['gambar'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favoriteMovie['nama'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(favoriteMovie['genre']),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          favoriteProvider.removeFavorite(favoriteMovieName);
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
