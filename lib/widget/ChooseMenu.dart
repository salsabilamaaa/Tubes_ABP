import 'package:flutter/material.dart';
import 'package:tubes_resto/Models/DetailBooking.dart';

class ChooseMenu extends StatefulWidget {
  ChooseMenu({Key? key, required this.detail}) : super(key: key);

  DetailBooking detail;
  @override
  State<ChooseMenu> createState() => _ChooseMenuState();
}

class _ChooseMenuState extends State<ChooseMenu> {
  late DetailBooking detail;

  @override
  void initState() {
    super.initState();
    detail = widget.detail;
  }

  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            height: 95,
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Container(
                      height: 65.0,
                      width: 65.0,
                      padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/ayam-bakar.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ayam Bakar",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16.0),
                        Text("Rp. 25.000")
                      ],
                    )
                  ],
                )),
                quantity == 0
                    ? addMenuButton(context)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RemoveButton(context),
                          Container(
                              width: 32,
                              child: Center(
                                  child: Text(
                                "$quantity",
                                style: TextStyle(fontSize: 16),
                              ))),
                          AddButton(context)
                        ],
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget addMenuButton(context) {
    return Container(
      width: 120,
      height: 42,
      margin: EdgeInsets.all(8),
      child: RawMaterialButton(
          onPressed: () {
            _add();
          },
          fillColor: Color.fromARGB(255, 16, 75, 11),
          child: Center(
            child: Text(
              "Tambah",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    );
  }

  Widget AddButton(context) {
    return Container(
      width: 42,
      height: 42,
      margin: const EdgeInsets.only(left: 16),
      child: RawMaterialButton(
          onPressed: () {
            _add();
          },
          fillColor: Color.fromARGB(255, 16, 75, 11),
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              )),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    );
  }

  Widget RemoveButton(context) {
    return Container(
      width: 42,
      height: 42,
      margin: const EdgeInsets.only(left: 16),
      child: RawMaterialButton(
          onPressed: () {
            _minus();
          },
          fillColor: Color.fromARGB(255, 16, 75, 11),
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              )),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    );
  }

  _add() {
    setState(() {
      quantity = quantity + 1;
    });
  }

  _minus() {
    setState(() {
      if (quantity != 0) {
        quantity = quantity - 1;
      }
    });
  }
}
