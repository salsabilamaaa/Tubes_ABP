import 'package:flutter/material.dart';

class status extends StatelessWidget {
  static const TextStyle judulStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle midStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle baseStyle = TextStyle(
    fontSize: 12,
    color: Colors.black,
  );
  final green = Color.fromRGBO(64, 111, 60, 1);
  final beige = Color.fromRGBO(255, 245, 231, 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: beige,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 80,
            width: 80,
            child: Image(
              image: AssetImage('assets/images/logo2.png'),
            ),
          ),
          Table(
            children: [
              TableRow(children: [
                TableCell(
                  child: Text(
                    'Restoran',
                    style: midStyle,
                  ),
                ),
                TableCell(
                  child: Text(
                    ': RM Padang',
                    style: midStyle,
                  ),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text(
                    'Lokasi',
                    style: midStyle,
                  ),
                ),
                TableCell(
                  child: Text(
                    ': Jl. Sukabirus 2',
                    style: midStyle,
                  ),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text(
                    'Tanggal',
                    style: midStyle,
                  ),
                ),
                TableCell(
                  child: Text(
                    ': 13 Juni 2022',
                    style: midStyle,
                  ),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text(
                    'Waktu',
                    style: midStyle,
                  ),
                ),
                TableCell(
                  child: Text(
                    ': 09.00 pm',
                    style: midStyle,
                  ),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text(
                    'Meja',
                    style: midStyle,
                  ),
                ),
                TableCell(
                  child: Text(
                    ': 12',
                    style: midStyle,
                  ),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Text(
                    'Harga',
                    style: midStyle,
                  ),
                ),
                TableCell(
                  child: Text(
                    ': Rp 50.000',
                    style: midStyle,
                  ),
                ),
              ])
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.topLeft,
            child: Text(
              'Pesanan',
              style: midStyle,
            ),
          ),
          DataTable(showBottomBorder: true, horizontalMargin: 0, columns: [
            DataColumn(
                label: Text(
              'Menu',
              style: midStyle,
            )),
            DataColumn(
                label: Text(
              'Jumlah',
              style: midStyle,
            )),
            DataColumn(
                label: Text(
              'Harga Satuan',
              style: midStyle,
            )),
            DataColumn(
                label: Text(
              'Harga',
              style: midStyle,
            )),
          ], rows: [
            DataRow(cells: [
              DataCell(Text(
                'Teh Manis',
                style: baseStyle,
              )),
              DataCell(Text(
                '3',
                style: baseStyle,
              )),
              DataCell(Text(
                '5.000',
                style: baseStyle,
              )),
              DataCell(Text(
                '15.000',
                style: baseStyle,
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                'Jus Jeruk',
                style: baseStyle,
              )),
              DataCell(Text(
                '3',
                style: baseStyle,
              )),
              DataCell(Text(
                '5.000',
                style: baseStyle,
              )),
              DataCell(Text(
                '15.000',
                style: baseStyle,
              )),
            ])
          ]),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: midStyle,
                ),
                Text(
                  'Rp 80.000',
                  style: midStyle,
                ),
              ],
            ),
          ),
          //Container(margin: EdgeInsets.only(top: 10), alignment:Alignment.topLeft, child: Text('alamat', style: baseStyle,))
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Center(
                child: Text(
                  "Batalkan Pesanan",
                  style: midStyle,
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
//Sumber:
//https://www.javatpoint.com/flutter-table