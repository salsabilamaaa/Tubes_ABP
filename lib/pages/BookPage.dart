import 'package:flutter/material.dart';
import 'package:tubes_resto/Models/DetailBooking.dart';
import 'package:tubes_resto/pages/MenuPage.dart';
import 'package:tubes_resto/widget/calendarclockBook.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key, required this.nameResto}) : super(key: key);

  final String nameResto;

  @override
  State<BookPage> createState() => _bookPageState();
}

class _bookPageState extends State<BookPage> {
  late DetailBooking detailBook;
  String PesanBooking = '';
  @override
  void initState() {
    super.initState();
    detailBook = DetailBooking(widget.nameResto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Detail Booking",
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              calendarclockBook(detailBook: detailBook),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.people_outline_rounded,
                      color: Color.fromARGB(255, 16, 75, 11),
                    ),
                  ),
                  Container(
                      width: 24,
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        detailBook.people.toString(),
                        style: const TextStyle(fontSize: 24),
                      )),
                  Wrap(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        margin: const EdgeInsets.only(left: 16),
                        child: RawMaterialButton(
                            onPressed: () {
                              _minus();
                            },
                            fillColor: const Color.fromARGB(255, 16, 75, 11),
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      Container(
                        width: 42,
                        height: 42,
                        margin: const EdgeInsets.only(left: 16),
                        child: RawMaterialButton(
                            onPressed: () {
                              _add();
                            },
                            fillColor: const Color.fromARGB(255, 16, 75, 11),
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      )
                    ],
                  )
                ]),
              ),
              Center(
                child: Text(
                  '$PesanBooking',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: buildButtonWidget(context));
  }

  Widget buildButtonWidget(context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      child: RawMaterialButton(
        onPressed: () {
          if (detailBook.bookDate.toString() == "" ||
              detailBook.bookTime.toString() == "") {
            setState(() {
              PesanBooking = "Tanggal dan Waktu Booking harus diisi";
            });
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MenuPage(detailBook: detailBook)));
          }
        },
        fillColor: Color.fromARGB(255, 16, 75, 11),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Pilih Menu",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  _add() {
    setState(() {
      detailBook.people = detailBook.people + 1;
    });
  }

  _minus() {
    setState(() {
      if (detailBook.people >= 1) {
        detailBook.people = detailBook.people - 1;
      }
    });
  }
}
