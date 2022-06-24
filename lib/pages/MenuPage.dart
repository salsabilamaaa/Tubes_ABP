import 'package:flutter/material.dart';
import 'package:tubes_resto/Models/DetailBooking.dart';
import 'package:tubes_resto/pages/PaymentPage.dart';
import 'package:tubes_resto/widget/ChooseMenu.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key, required this.detailBook}) : super(key: key);

  DetailBooking detailBook;

  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late DetailBooking detail;

  @override
  void initState() {
    super.initState();
    detail = widget.detailBook;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pilih Menu",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ChooseMenu(
              detail: detail,
            )
          ],
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
                  builder: (context) => PaymentPage(detailBook: detail)));
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
