import 'package:flutter/material.dart';
import 'package:tubes_resto/pages/BookPage.dart';
import 'package:tubes_resto/widget/ListMenu.dart';
import 'package:tubes_resto/widget/detailResto.dart';
import 'package:tubes_resto/widget/profilResto.dart';

class RestoPage extends StatelessWidget {
  String nameResto = "Rumah Makan Bunda";
  // const RestoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [profilResto(), detailResto(), ListMenu()],
        ),
      ),
      floatingActionButton: buildButtonWidget(context),
    );
  }

  Widget buildButtonWidget(context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      child: RawMaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookPage(nameResto: nameResto)));
        },
        fillColor: Color.fromARGB(255, 16, 75, 11),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Booking",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
