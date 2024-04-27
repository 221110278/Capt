import 'package:flutter/material.dart';
import 'package:tugas/components/listTiket.dart';
import 'package:tugas/data/listFilm.dart';

class Tiket extends StatefulWidget {
  final String nama;

  const Tiket({Key? key, required this.nama}) : super(key: key);

  @override
  _TiketState createState() => _TiketState();
}

class _TiketState extends State<Tiket> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> selectedFilm =
        listFilm.firstWhere((film) => film['nama'] == widget.nama);

    int jumlahTiket = selectedFilm['jumlahTiket'];

    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Pemesanan Tiket', 
          style: TextStyle(
            fontSize: 25, 
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        centerTitle: true,
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
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Mau beli berapa tiket?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (jumlahTiket > 0) jumlahTiket--;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      '$jumlahTiket',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          jumlahTiket++;
                        
                          selectedFilm['jumlahTiket'] = jumlahTiket;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListTiket(jumlahTiket: jumlahTiket),
                      ),
                    );
                  },
                  child: Text('Lihat Tiket'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
