import 'package:flutter/material.dart';
import 'package:tubes_resto/pages/page_riwayat.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_resto/models/Pesanan.dart';

class listRiwayat extends StatefulWidget {

  @override
  State<listRiwayat> createState() => _listRiwayatState();
}

class getRiwayat {
  final url = 'http://127.0.0.1:8000/api/riwayat';

  Future<List<Pesanan>> getR() async{
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode==200){
        Iterable it = jsonDecode(response.body);
        List<Pesanan> pesanan = it.map((e) => Pesanan.fromJson(e)).toList();
        return pesanan;
      }else{
        throw 'Failed to load data';
      }
    }catch(e){
      throw(e.toString());
    }
  }
}

class _listRiwayatState extends State<listRiwayat> {
  final green = Color.fromRGBO(64, 111, 60, 1);
  //style variabel
  static const TextStyle judulStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold,);
  static const TextStyle namaRestoStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold,);
  static const TextStyle baseStyle =
      TextStyle(fontSize: 12, color: Colors.black,);
  static const TextStyle button =
      TextStyle(fontSize: 18, color: Colors.white,); 

  List<Pesanan> listRiwayat = [];
  getRiwayat data2 = getRiwayat();

  getData2() async{
    listRiwayat = await data2.getR();
  }

  void initState(){
    getData2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
              future: data2.getR(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Container(
                  margin: EdgeInsets.all(10),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        child: InkWell(
                          onTap: () { 
                           Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => riwayat(p: listRiwayat[index],))
                            );
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: 72,
                                      width: 72, 
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        shape: BoxShape.rectangle,
                                        image: const DecorationImage(
                                          image: AssetImage('assets/images/logo2.png'),
                                          fit: BoxFit.cover,
                                        )
                                      ), 
                                    ),
                                    Container(
                                      width: 227,
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        textDirection: TextDirection.ltr,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Text(listRiwayat[index].resto_id.toString(), style: namaRestoStyle,),
                                        //Text(listPesanan[index].date_reservasi, style: pesananPage.baseStyle,)
                                        Text(listRiwayat[index].date_reservasi, style: baseStyle,)
                                        ] 
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                              Container(
                                child: IconButton(onPressed: (){}, icon: Icon(Icons.phone)),
                              )
                            ],
                          ),
                        ),
                      );
                    }, 
                    separatorBuilder: (context, index){
                      return Divider();
                    },
                    itemCount: listRiwayat.length,
                    )
                  );
                }else{
                  return Center(child: Text('Kosong', style: baseStyle,));
                }
              },   
            ); 
    }
  }