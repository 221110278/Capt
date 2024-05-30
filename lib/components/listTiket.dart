import 'package:flutter/material.dart';
import 'package:tugas/components/bookedTiket.dart';
import 'package:tugas/components/favorite.dart';
import 'package:tugas/components/listUsers.dart';
import 'package:tugas/screens/home.dart';

class ListTiket extends StatefulWidget {
  final int jumlahTiket;

  const ListTiket({Key? key, required this.jumlahTiket}) : super(key: key);

  @override
  _ListTiketState createState() => _ListTiketState();
}

class _ListTiketState extends State<ListTiket> {
  late List<bool> isSelected;
  late int maxSelection;
  late double cmToPixel;
  late List<int> selectedSeats = [];

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.filled(16, false);
    maxSelection = widget.jumlahTiket;
  }

  @override
  Widget build(BuildContext context) {
    cmToPixel = MediaQuery.of(context).devicePixelRatio * 1.7952755906;

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Tiket'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
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
                        builder: (context) => Home(username: 'username', selectedSeats: []), // Replace with actual data
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
                        builder: (context) => BookedSeatsScreen(bookedSeats: []), // Replace with actual data
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.grey[800],
            alignment: Alignment.center,
            child: const Text(
              "Screen",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 16,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _handleTap(index),
                  child: SizedBox(
                    width: cmToPixel, 
                    height: cmToPixel,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected[index] ? Colors.blue : Colors.grey[300],
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          'Seat ${index + 1}',
                          style: TextStyle(color: isSelected[index] ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _orderSeats,
            child: const Text('Pesan'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(
                    username: listUsers.isNotEmpty ? listUsers.first["username"] : "username",
                    selectedSeats: selectedSeats, 
                  ),
                ),
              );
            },
            child: const Text('Kembali ke Menu Utama'),
          ),
        ],
      ),
    );
  }

  void _handleTap(int index) {
    setState(() {
      if (isSelected[index]) {
        isSelected[index] = false;
      } else {
        if (isSelected.where((element) => element).length < maxSelection) {
          isSelected[index] = true;
        }
      }
    });
  }

  void _orderSeats() {
    selectedSeats = List<int>.generate(isSelected.length, (i) => i).where((i) => isSelected[i]).toList();
  }
}


