import 'package:flutter/material.dart';
import 'package:tubes_resto/pages/buatprofil.dart';
import 'package:tubes_resto/pages/login.dart';

String Pesan1 = "";

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 16, 75, 11),
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        body: const _SignUpState(),
      ),
    );
  }
}

class _SignUpState extends StatefulWidget {
  const _SignUpState({Key? key}) : super(key: key);

  @override
  State<_SignUpState> createState() => _Login();
}

class _Login extends State<_SignUpState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                padding: const EdgeInsets.all(10),
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
              padding: const EdgeInsets.all(2),
              child: const Text(
                "Sign Up",
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
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 2, left: 10, right: 10),
              child: Text(
                '$Pesan1',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ElevatedButton(
                child: const Text(
                  "Daftar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  if (nameController.text == "" ||
                      passwordController.text == "" ||
                      emailController.text == "") {
                    setState(() {
                      Pesan1 =
                          "Pastikan Email, Username, dan Password sudah Diisi";
                    });
                  } else {
                    Navigator.push((context),
                        MaterialPageRoute(builder: (context) => Profil()));
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
