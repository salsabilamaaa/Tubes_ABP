import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tubes_resto/pages/login.dart';

String Pesan = '';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 16, 75, 11),
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        // appBar: AppBar(
        // title: const Text('Welcome'),
        // centerTitle: true,
        // ),
        body: const _resetPassword(),
      ),
    );
  }
}

class _resetPassword extends StatefulWidget {
  const _resetPassword({Key? key}) : super(key: key);

  @override
  State<_resetPassword> createState() => _reset();
}

class _reset extends State<_resetPassword> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Image.asset('assets/images/logo.png'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Resto",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              child: const Text(
                "Reset Password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: TextField(
                obscureText: true,
                controller: password2Controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: " Ulangi Password"),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 2, left: 10, right: 10),
              child: Text(
                '$Pesan',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ElevatedButton(
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  if (nameController.text == "" ||
                      passwordController.text == "" ||
                      password2Controller.text == "" ||
                      emailController.text == "") {
                    setState(() {
                      Pesan = "Pastikan Semua Data Sudah Diisi";
                    });
                  } else {
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => SplashScreen()));
                  }
                },
              ),
            ),
            Row(
              children: <Widget>[
                const Text("Sudah Punya Akun? "),
                TextButton(
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push((context),
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/done1.png'),
              Text(
                "Password Berhasil Diganti",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void movingToNextScreen() {
    Timer(
        Duration(
          seconds: 1,
        ), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ));
    });
  }

  @override
  void initState() {
    super.initState();
    movingToNextScreen();
  }
}
