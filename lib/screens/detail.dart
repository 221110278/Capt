import 'package:flutter/material.dart';
import 'package:tugas/components/pesan-tiket.dart';
import 'package:tugas/data/listFilm.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.nama,});

  final String nama;
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
  Map<String, dynamic> selectedFilm = listFilm.firstWhere((film) => film['nama'] == widget.nama);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedFilm['nama']),
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Image.network(
                  selectedFilm['gambar'],
                ),
                const SizedBox(height: 20),
                Text(
                  '${selectedFilm['nama']}',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 24,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 24,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 24,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 24,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 24,
                ),
                ],),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: 500,
                    child: Text(
                      '${selectedFilm['deskripsi']}',
                      style: const TextStyle(fontSize: 16),textAlign: TextAlign.justify,
                    ),
                  ),
                ),
               const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
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
        onPressed: (){
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border_outlined
        ),
    )
    );
  }
}
