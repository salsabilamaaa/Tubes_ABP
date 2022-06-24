import 'package:flutter/material.dart';

class profilResto extends StatefulWidget {
  const profilResto({Key? key}) : super(key: key);

  @override
  State<profilResto> createState() => _profilRestoState();
}

class _profilRestoState extends State<profilResto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Image Resto
        Container(
          constraints: BoxConstraints.expand(
            height: 240.0,
          ),
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/resto1.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(1.0), BlendMode.modulate),
              ),
              borderRadius: BorderRadius.circular(8)),
          child: const Text('Rumah Makan Bunda',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white)),
        ),
        // Alamat Resto
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(Icons.location_pin),
              ),
              Text("Jalan Sukabirus No. 20, Bojongsoang")
            ],
          ),
        ),

        // Kategori Resto
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                        width: 0.5, color: Color.fromARGB(255, 16, 75, 11))),
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Text(
                    "Seafood",
                    style: TextStyle(
                        color: Color.fromARGB(255, 16, 75, 11),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                        width: 0.5, color: Color.fromARGB(255, 16, 75, 11))),
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Text(
                    "Tradisional",
                    style: TextStyle(
                        color: Color.fromARGB(255, 16, 75, 11),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
