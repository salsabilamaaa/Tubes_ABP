import 'package:flutter/material.dart';
import 'package:tubes_resto/pages/page_status.dart';

class pesananPage extends StatelessWidget {
  //style variabel
  static const TextStyle judulStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle namaRestoStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle baseStyle = TextStyle(
    fontSize: 12,
    color: Colors.black,
  );
  static const TextStyle button = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );
  final green = Color.fromRGBO(64, 111, 60, 1);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Pesanan',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          bottom: TabBar(
              unselectedLabelColor: green,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: green),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: green,
                          width: 1,
                        )),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Proses',
                        style: judulStyle,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: green,
                          width: 1,
                        )),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Riwayat',
                        style: judulStyle,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
        body: TabBarView(children: [
          Container(
            margin: EdgeInsets.all(10),
            child: ListView(children: [
              /*Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))
                      ),
                    child: ListTile(
                      onTap: () { 
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => status())
                        );
                      },
                      leading: Container(
                        height: 72,
                        width: 72, 
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage('assets/logo.png'),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      title: Text('RM Padang', style: namaRestoStyle,),
                      subtitle: Text('Hari ini, 15.30 pm'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.phone)),
                        ]
                        ),
                    ),
                  ),*/
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => status()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(children: [
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
                                )),
                          ),
                          Container(
                            width: 227,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                                textDirection: TextDirection.ltr,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'RM Padang',
                                    style: namaRestoStyle,
                                  ),
                                  Text(
                                    'Hari ini, 15.30 pm',
                                    style: baseStyle,
                                  )
                                ]),
                          ),
                        ]),
                      ),
                      Container(
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.phone)),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ), //hal. tab 1
          Container(
            margin: EdgeInsets.all(10),
            child: ListView(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => status()));
                  },
                  leading: SizedBox(
                    height: 72,
                    width: 72,
                    child: Container(
                      color: green,
                    ),
                  ),
                  title: Text(
                    'RM Padang',
                    style: namaRestoStyle,
                  ),
                  subtitle: Text('Hari ini, 15.30 pm'),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
                  ]),
                ),
              ),
            ]),
          ), //hal. tab 2
        ]),
      ),
    );
  }
}
//Sumber: 
//https://medium.com/codechai/flutter-boring-tab-to-cool-tab-bfcb1a93f8d0
//https://skillplus.web.id/menggunakan-listtile/
//https://www.kindacode.com/snippet/flutter-listtile-with-multiple-trailing-icon-buttons/