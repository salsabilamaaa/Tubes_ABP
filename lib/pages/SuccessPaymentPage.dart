import 'package:flutter/material.dart';
import 'package:tubes_resto/pages/home.dart';
import 'package:tubes_resto/pages/main_screen.dart';
import 'package:tubes_resto/pages/pesanan_Proses.dart';

class SuccessPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/success.jpg'),
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(height: 24),
            Text("Pembayaran Booking Selesai",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ]),
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
              context, MaterialPageRoute(builder: (context) => MainScreen()));
        },
        fillColor: Color.fromARGB(255, 16, 75, 11),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Kembali ke Beranda",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
