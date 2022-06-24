import 'package:flutter/material.dart';
import 'package:tubes_resto/pages/Profil.dart';
import 'package:tubes_resto/pages/main_screen.dart';

String Pesan = "";

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 16, 75, 11),
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 16,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Buat Profil'),
        ),
        body: const _SetProfil(),
      ),
    );
  }
}

class _SetProfil extends StatefulWidget {
  const _SetProfil({Key? key}) : super(key: key);

  @override
  State<_SetProfil> createState() => _Profil();
}

class _Profil extends State<_SetProfil> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contacController = TextEditingController();
  TextEditingController AlamatController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController BirthController = TextEditingController();

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: contacController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nomor Hp",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: 5,
                controller: AlamatController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Alamat",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: 5,
                controller: BirthController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Tempat Lahir",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: 80,
              child: TextField(
                  controller: dateinput,
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: "Tanggal Lahir"),
                  readOnly: true,
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    dateinput.text = date.toString().substring(0, 10);
                  }),
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
                  "Simpan",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  if (nameController.text == "" ||
                      contacController.text == "" ||
                      dateinput.text == "" ||
                      BirthController.text == "" ||
                      AlamatController.text == '') {
                    setState(() {
                      Pesan = "Pastikan Semua Data Sudah Diisi";
                    });
                  } else {
                    Navigator.push((context),
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
