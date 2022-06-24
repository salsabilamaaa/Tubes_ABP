import 'package:flutter/material.dart';
import 'package:tubes_resto/Models/DetailBooking.dart';
import 'package:tubes_resto/pages/SuccessPaymentPage.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key? key, required this.detailBook}) : super(key: key);

  DetailBooking detailBook;

  @override
  State<PaymentPage> createState() => _PaymentState();
}

class _PaymentState extends State<PaymentPage> {
  late DetailBooking detail;
  String dropDownValue = "BRI";

  @override
  void initState() {
    super.initState();
    detail = widget.detailBook;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
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
            Container(
              height: 94,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 65.0,
                    width: 65.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/Resto-1.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detail.resto,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text("Jalan Sukabirus No. 20, Bojongsoang")
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text('Detail Booking',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tanggal Reservasi'),
                              Text('Waktu Reservasi'),
                              Text('Jumlah Orang')
                            ],
                          )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(detail.bookDate.toString().substring(0, 10),
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(detail.bookTime.toString().substring(10, 15),
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(detail.people.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          )
                        ],
                      ),
                    ])),
            SizedBox(
              height: 8.0,
            ),
            Container(
                height: 130,
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Metode Pembayaran",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    DropdownButtonFormField(
                      isExpanded: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                      value: dropDownValue,
                      items: <String>[
                        'BRI',
                        'Mandiri',
                        'BNI',
                        'BCA',
                        'Gopay',
                        'Ovo',
                        'Dana',
                        'Bank Lain',
                        'e-wallet Lain'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                          detail.methodPayment = dropDownValue;
                        });
                      },
                    )
                  ],
                )),
            SizedBox(
              height: 8.0,
            ),
            Container(
                // height: MediaQuery.of(context).size.height,
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Detail Menu',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Container(
                                      height: 42.0,
                                      width: 42.0,
                                      padding: const EdgeInsets.only(
                                          left: 16.0, bottom: 8.0, top: 8.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/ayam-bakar.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      "Ayam Bakar",
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                )),
                                Text(
                                  '1x',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                SizedBox(width: 16),
                                Text(
                                  "Rp. 25.000",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 8.0),
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text('Detail Pembayaran',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Biaya Menu"),
                          Text("Total Biaya Booking"),
                          Text("Total Pembayaran",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )),
                      Column(
                        children: [
                          Text("Rp. 25.000"),
                          Text("Rp. 50.000"),
                          Text("Rp. 75.000",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SuccessPaymentPage()));
        },
        fillColor: Color.fromARGB(255, 16, 75, 11),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Bayar Sekarang",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
