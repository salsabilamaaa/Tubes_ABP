import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  SearchCard({Key? key}) : super(key: key);
  final TextEditingController _searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: "cari menu, tempat makan, lokasi terdekat",
            prefixIcon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 197, 192, 192),
            ),
            hintStyle: TextStyle(
              fontSize: 12.0,
              color: Color.fromARGB(255, 197, 192, 192),
            ),
          ),
          maxLines: 1,
          controller: _searchControl,
        ),
      ),
    );
  }
}