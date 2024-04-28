import 'package:flutter/material.dart';
import 'package:tugas/data/listFilm.dart';
import 'package:tugas/screens/detail.dart';

class AllFilm extends StatefulWidget {

  const AllFilm({Key? key}) : super(key: key);

  @override
  _AllFilmState createState() => _AllFilmState();
}

class _AllFilmState extends State<AllFilm> {
  List <Map<String,dynamic>> pilihan = [
    {"genre":"Animation","selected":false},
    {"genre":"Fantasy","selected":false},
    {"genre":"Horor","selected":false},
    {"genre":"Drama","selected":false},
    {"genre":"Comedy","selected":false},
    {"genre":"Romance","selected":false},
    {"genre":"Thriller","selected":false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Capt Film",
          style: TextStyle(
            fontSize: 25, 
            fontWeight: FontWeight.bold,
            ),
          ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < pilihan.length; i++)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: ChoiceChip(
                  label: Text("${pilihan[i]['genre']}"),
                  selected: pilihan[i]['selected'],
                  onSelected: (bool e) {
                    setState(() {
                      pilihan[i]['selected'] = e;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
            Expanded(
              child: GridView(gridDelegate: 
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8
                ),
                children: [
                  ...listFilm.map((e){
                    return Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
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
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(onPressed: (){
                                Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                  return Detail(nama: '${e["nama"]}');}));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0
                              ), 
                              child: Text(
                                '${e['nama']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                  ),
                                textAlign: TextAlign.center,
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
                        ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
        ),
    );
  }
}