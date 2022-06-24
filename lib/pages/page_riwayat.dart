//import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:tubes/model.dart';

class riwayat extends StatefulWidget {
  static const TextStyle judulStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold,);
  static const TextStyle midStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold,);
  static const TextStyle baseStyle =
      TextStyle(fontSize: 12, color: Colors.black,);

  @override
  State<riwayat> createState() => _riwayatState();
}

class _riwayatState extends State<riwayat> {
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
          )
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10) ,
                height: 80, width: 80, 
                child: Image(image: AssetImage('assets/logo.png'),), 
              ),
              Table(
                
                children: [
                  TableRow(
                    children: [
                      TableCell(child: Text('Restoran', style: riwayat.midStyle,),),
                      TableCell(child: Text(': RM Padang', style: riwayat.midStyle,),),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Text('Lokasi', style: riwayat.midStyle,),),
                      TableCell(child: Text(': Jl. Sukabirus 2', style: riwayat.midStyle,),),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Text('Tanggal', style: riwayat.midStyle,),),
                      TableCell(child: Text(': 13 Juni 2022', style: riwayat.midStyle,),),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Text('Waktu', style: riwayat.midStyle,),),
                      TableCell(child: Text(': 09.00 pm', style: riwayat.midStyle,),),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Text('Meja', style: riwayat.midStyle,),),
                      TableCell(child: Text(': 12', style: riwayat.midStyle,),),
                    ]
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Text('Harga', style: riwayat.midStyle,),),
                      TableCell(child: Text(': Rp 50.000', style: riwayat.midStyle,),),
                    ]
                  )
                ],
              ),
              Container(margin: EdgeInsets.symmetric(vertical: 20), alignment:Alignment.topLeft, child: Text('Pesanan', style: riwayat.midStyle,),),
              //fitted box
              DataTable(
                showBottomBorder: true,
                horizontalMargin: 0,
                columns: [
                  DataColumn(label: Text('Menu', style: riwayat.midStyle,)),
                  DataColumn(label: Text('Jumlah', style: riwayat.midStyle,)),
                  DataColumn(label: Text('Harga Satuan', style: riwayat.midStyle,)),
                  DataColumn(label: Text('Harga', style: riwayat.midStyle,)),
                ], 
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Teh Manis', style: riwayat.baseStyle,)),
                      DataCell(Text('3', style: riwayat.baseStyle,)),
                      DataCell(Text('5.000', style: riwayat.baseStyle,)),
                      DataCell(Text('15.000', style: riwayat.baseStyle,)),
                    ]
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Jus Jeruk', style: riwayat.baseStyle,)),
                      DataCell(Text('3', style: riwayat.baseStyle,)),
                      DataCell(Text('5.000', style: riwayat.baseStyle,)),
                      DataCell(Text('15.000', style: riwayat.baseStyle,)),
                    ]
                  )
                ]
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: riwayat.midStyle,),
                    Text('Rp 80.000', style: riwayat.midStyle,),
                  ],
                ),
              ),
              //Container(margin: EdgeInsets.only(top: 10), alignment:Alignment.topLeft, child: Text('alamat', style: baseStyle,))
            ]
          ),
        ),
      )
    );
  }
}
//Sumber:
//https://www.javatpoint.com/flutter-table