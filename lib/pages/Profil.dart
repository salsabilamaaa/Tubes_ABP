import 'package:flutter/material.dart';
import 'package:tubes_resto/pages/buatprofil.dart';
import 'package:tubes_resto/pages/home.dart';
import 'package:tubes_resto/pages/login.dart';
import 'package:tubes_resto/pages/maps.dart';
import 'package:tubes_resto/pages/pesanan_Proses.dart';
import 'package:tubes_resto/util/const.dart';

class userProfile extends StatelessWidget {
  const userProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 16, 75, 11),
        fontFamily: 'Poppins',
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: (Text('Profil')),
          ),
          body: const _userProfile(),
        ),
      ),
    );
  }
}

class _userProfile extends StatefulWidget {
  const _userProfile({Key? key}) : super(key: key);

  @override
  State<_userProfile> createState() => myProfile();
}

class myProfile extends State<_userProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 220, 187),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Color.fromARGB(255, 55, 116, 60), width: 2)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hai,',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                        Text('Andrew Marthin',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text('+62-822-9394-0459',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                        Text("anrew@gmail.com",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Container(
                margin: const EdgeInsets.only(right: 10, top: 50),
                child: ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 29, 109, 49)),
                    onPressed: () {
                      Navigator.push((context),
                          MaterialPageRoute(builder: (context) => Profil()));
                    },
                    child: const Text(
                      "Edit",
                    )),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 30, top: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(bottom: 5),
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.history),
                        margin: const EdgeInsets.only(right: 30),
                      ),
                      Container(
                        child: Text('Riwayat'),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.help_center_rounded),
                        margin: const EdgeInsets.only(right: 30),
                      ),
                      Container(
                        child: Text('Bantuan'),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.warning_amber),
                        margin: const EdgeInsets.only(right: 30),
                      ),
                      Container(
                        child: Text('Syarat dan Kebijakan'),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.logout_sharp),
                        margin: const EdgeInsets.only(right: 30),
                      ),
                      Container(
                        child: Text('Keluar'),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = FlatButton(
    child: const Text('Yes'),
    onPressed: () {
      Navigator.push(
          (context), MaterialPageRoute(builder: (context) => Login()));
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text('Keluar', style: TextStyle(fontWeight: FontWeight.bold)),
    content: const Text(' Yakin Ingin keluar? '),
    actions: [
      okButton,
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
