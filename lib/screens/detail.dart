import 'package:flutter/material.dart';
import 'package:tugas/data/listFilm.dart';

class Detail extends StatelessWidget {
  Detail({Key? key, required this.nama});

  final String nama;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> selectedFilm = listFilm.firstWhere((film) => film['nama'] == nama);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedFilm['nama']),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Image.network(
                  selectedFilm['gambar'],
                ),
                SizedBox(height: 20),
                Text(
                  '${selectedFilm['nama']}',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '${selectedFilm['genre']}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Center(
                  child: Container(
                    width: 500,
                    child: Text(
                      '${selectedFilm['deskripsi']}',
                      style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
