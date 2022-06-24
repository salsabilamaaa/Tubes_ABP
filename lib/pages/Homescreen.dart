import 'package:flutter/material.dart';
import 'package:tubes_resto/pages/SignUp.dart';
import 'package:tubes_resto/pages/login.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        // appBar: AppBar(
        // title: const Text('Welcome'),
        // centerTitle: true,
        // ),
        body: const _HomeScreenState(),
      ),
    );
  }
}

class _HomeScreenState extends StatefulWidget {
  const _HomeScreenState({Key? key}) : super(key: key);

  @override
  State<_HomeScreenState> createState() => _homescreen();
}

class _homescreen extends State<_HomeScreenState> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 200),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset('assets/images/logo2.png'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Selamat Datang ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 16, 75, 11)),
                child: const Text(
                  "Masuk",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 241, 238, 238),
                    side: BorderSide(color: Color.fromARGB(255, 16, 75, 11))),
                child: const Text(
                  "Daftar",
                  style: TextStyle(
                      color: Color.fromARGB(255, 16, 75, 11), fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
