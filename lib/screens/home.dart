import 'package:flutter/material.dart';
import 'package:tugas/data/listFilm.dart';
import 'package:tugas/screens/detail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
      ),
      body: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Now Showing...',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
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
                                return Detail(nama: '${e["nama"]}');}));
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
    )
    );
  }
}
