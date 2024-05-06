import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key, required this.favoriteMovies});
  final List<String> favoriteMovies;
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Movie"),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: ListView.builder(
          itemCount: widget.favoriteMovies.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(widget.favoriteMovies[index]),
            );
          }
          ),
        ),
    );
  }
}