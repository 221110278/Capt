import 'package:flutter/material.dart';
import 'package:tugas/components/bookedTiket.dart';
import 'package:tugas/components/favorite.dart';
import 'package:tugas/components/listTiket.dart';
import 'package:tugas/data/listFilm.dart';
import 'package:tugas/screens/home.dart';

class Tiket extends StatefulWidget {
  final String nama;

  const Tiket({Key? key, required this.nama}) : super(key: key);

  @override
  _TiketState createState() => _TiketState();
}

class _TiketState extends State<Tiket> {
  late Map<String, dynamic> selectedFilm;
  late int jumlahTiket;
  

  final List<DateTime> dateOptions = [
    DateTime.now(),
    DateTime.now().add(Duration(days: 1)),
    DateTime.now().add(Duration(days: 2)),
    DateTime.now().add(Duration(days: 3)),
  ];

  final List<TimeOfDay> timeOptions = [
    TimeOfDay(hour: 10, minute: 0),
    TimeOfDay(hour: 12, minute: 0),
    TimeOfDay(hour: 14, minute: 0),
    TimeOfDay(hour: 16, minute: 0),
  ];

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    selectedFilm = listFilm.firstWhere((film) => film['nama'] == widget.nama);
    jumlahTiket = selectedFilm['jumlahTiket'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pemesanan Tiket',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
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
                        builder: (context) => Favorite(favoriteMovies: []),
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
                    Tooltip(
                      message: 'Kurangi Tiket',
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (jumlahTiket > 0) jumlahTiket--;
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ),
                    Text(
                      '$jumlahTiket',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Tooltip(
                      message: 'Tambah Tiket',
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            jumlahTiket++;
                            selectedFilm['jumlahTiket'] = jumlahTiket;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Pilih Tanggal",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: 10,
                  children: dateOptions.map((date) {
                    return ChoiceChip(
                      label: Text(
                        '${date.day}-${date.month}-${date.year}',
                      ),
                      selected: selectedDate == date,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedDate = selected ? date : null;
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  "Pilih Waktu",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: 10,
                  children: timeOptions.map((time) {
                    return ChoiceChip(
                      label: Text(
                        '${time.format(context)}',
                      ),
                      selected: selectedTime == time,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedTime = selected ? time : null;
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: selectedDate != null && selectedTime != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTiket(
                                jumlahTiket: jumlahTiket,
                                selectedDate: selectedDate!,
                                selectedTime: selectedTime!,
                              ),
                            ),
                          );
                          
                        }
                      : null,
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
