import 'package:flutter/material.dart';
import 'package:tugas/components/listUsers.dart';
import 'package:tugas/data/listFilm.dart';
import 'package:tugas/screens/home.dart';

class ListTiket extends StatefulWidget {
  final int jumlahTiket;

  const ListTiket({Key? key, required this.jumlahTiket}) : super(key: key);

  @override
  _ListTiketState createState() => _ListTiketState();
}

class _ListTiketState extends State<ListTiket> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> filteredFilms = listFilm.where((film) => film['jumlahTiket'] > 0).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Tiket',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredFilms.length,
              itemBuilder: (context, index) {
                String namaFilm = filteredFilms[index]["nama"];
                int jumlahTiket = filteredFilms[index]["jumlahTiket"];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(namaFilm),
                      Text('$jumlahTiket tiket'),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: widget.jumlahTiket > 0 ? null : () {
                      String username = listUsers.isNotEmpty ? listUsers.first["username"] : "username";
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(username: username), 
                        ),
                      );
                    },
                    icon: Icon(widget.jumlahTiket > 0 ? Icons.check : Icons.local_movies),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String username = listUsers.isNotEmpty ? listUsers.first["username"] : "username";
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(username: username),
                ),
              );
            },
            child: Text('Kembali ke Menu Utama'),
          ),
        ],
      ),
    );
  }
}


