import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tubes_resto/models/Pesanan.dart';
import 'package:tubes_resto/models/Resto.dart';

class status extends StatefulWidget {
  final Pesanan p;
  const status({Key? key, required this.p}):super(key: key);

  static const TextStyle judulStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold,);
  static const TextStyle midStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold,);
  static const TextStyle baseStyle =
      TextStyle(fontSize: 12, color: Colors.black,);

  @override
  State<status> createState() => _statusState();
}


class _statusState extends State<status> {
  final green = Color.fromRGBO(64, 111, 60, 1);
  final beige = Color.fromRGBO(255, 245, 231, 1);


  @override
  initState() {
    super.initState();
  }
  getDetail() async{
    final url = 'http://127.0.0.1:8000/api/detail/'+'${widget.p.resto_id}';
    try{
      final response = await http.get(Uri.parse(url));
    
      if(response.statusCode==200){
        var x = jsonDecode(response.body);
        Resto resto = Resto.fromJson(x);
        //List<String> info = [resto.nameResto, resto.alamat];
        return resto;
      }else{
        throw 'Failed to load data';
      }
    }catch(e){
      throw(e.toString());
    }
  }

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
        body: FutureBuilder(
          future: getDetail(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              Resto info = snapshot.data as Resto;
              return Container(
                margin: EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10) ,
                      height: 80, width: 80, 
                      child: Image(image: AssetImage('assets/images/logo.png'),), 
                    ),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            TableCell(child: Text('Restoran', style: status.midStyle,),),
                            TableCell(child: Text(': '+info.nameResto, style: status.midStyle,),),
                          ]
                        ),
                        TableRow(
                          children: [
                            TableCell(child: Text('Lokasi', style: status.midStyle,),),
                            TableCell(child: Text(': '+info.alamat, style: status.midStyle,),),
                          ]
                        ),
                        TableRow(
                          children: [
                            TableCell(child: Text('Tanggal', style: status.midStyle,),),
                            TableCell(child: Text(': ${widget.p.date_reservasi}', style: status.midStyle,),),
                          ]
                        ),
                        TableRow(
                          children: [
                            TableCell(child: Text('Waktu', style: status.midStyle,),),
                            TableCell(child: Text(': ${widget.p.time_reservasi}', style: status.midStyle,),),
                          ]
                        ),
                        TableRow(
                          children: [
                            TableCell(child: Text('Meja', style: status.midStyle,),),
                            TableCell(child: Text(': ${widget.p.no_table}', style: status.midStyle,),),
                          ]
                        ),
                        TableRow(
                          children: [
                            TableCell(child: Text('Harga', style: status.midStyle,),),
                            TableCell(child: Text(': Rp 50.000', style: status.midStyle,),),
                          ]
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: Center(
                          child: Text("Batalkan Pesanan", style: status.midStyle,),
                        ),
                      ),
                    )
                  ]
                ),
              );
            }else{
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
          
        ),
      )
    );
  }
}
//Sumber:
//https://www.javatpoint.com/flutter-table