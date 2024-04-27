import 'package:flutter/material.dart';
import 'package:tugas/components/listTiket.dart';
import 'package:tugas/data/listFilm.dart';
import 'package:tugas/screens/detail.dart';

class Home extends StatelessWidget {
  final String username;
  Home({Key? key, required this.username});
  
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
                  '$username',
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
      child: Text(
        "Now Showing...",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        )
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
    ),
    bottomNavigationBar: BottomAppBar(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.home),
        onPressed: () {},
      ),
      IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListTiket(jumlahTiket: jumlahTiket),
      ),
    );
  },
  icon: Icon(Icons.shopping_cart),
),

      IconButton(
        onPressed: () {},
        icon: Icon(Icons.person),
      ),
    ],
  ),
),

    );
  }
}

                 
