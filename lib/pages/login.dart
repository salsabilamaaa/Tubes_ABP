import 'package:flutter/material.dart';
import 'package:tubes_resto/pages/Profil.dart';
import 'package:tubes_resto/pages/forgetpassword.dart';
import 'package:tubes_resto/pages/SignUp.dart';
import 'package:tubes_resto/pages/main_screen.dart';
import 'package:http/http.dart' as http;

String Pesan2 = "";

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 16, 75, 11),
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        body: const _LogInState(),
      ),
    );
  }
}

class _LogInState extends StatefulWidget {
  const _LogInState({Key? key}) : super(key: key);

  @override
  State<_LogInState> createState() => _Login();
}

class _Login extends State<_LogInState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Resto",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: Text(
                '$Pesan2',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              child: const Text(
                'Lupa Password ?',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 15,
                ),
              ),
              onPressed: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => ForgetPassword()));
              },
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 16, 75, 11)),
                child: const Text(
                  "Masuk",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  if (nameController.text == "" ||
                      passwordController.text == "") {
                    setState(() {
                      Pesan2 = "Username dan Password Harus Diisi";
                    });
                  } else {
                    login();
                  }
                },
              ),
            ),
            Row(
              children: <Widget>[
                const Text("Belum Punya Akun? "),
                TextButton(
                  child: const Text(
                    'Daftar Dulu',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push((context),
                        MaterialPageRoute(builder: (context) => SignUp()));
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

  Future<void> login() async {
    if (passwordController.text.isNotEmpty && nameController.text.isNotEmpty) {
      print("Halo");
      var response = await http.post(
          Uri.parse("http://127.0.0.1:8000/api/login"),
          body: ({
            'username': nameController.text,
            'password': passwordController.text
          }));

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
            "Login Success!",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ));

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MainScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
            "Username or password is wrong, please try again",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
            "Please fill in all the blank form",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red));
    }
  }
}
