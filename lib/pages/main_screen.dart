import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubes_resto/models/Resto.dart';
import 'package:tubes_resto/pages/Profil.dart';
import 'package:tubes_resto/pages/home.dart';
import 'package:tubes_resto/pages/maps.dart';
import 'package:tubes_resto/pages/pesanan_Proses.dart';
import 'package:http/http.dart' as http;
import '../util/const.dart';

Future<List<Resto>> fetchUser(http.Client client, String token) async {
  final response = await client
      .get(Uri.parse('http://10.0.2.2:8000/api/customer'), headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + token
  });
  return compute(parseResto, response.body);
}

List<Resto> parseResto(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Resto>((json) => Resto.fromJson(json)).toList();
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //late PageController _pageController;
  int _page = 0;

  static List<Widget> pages = <Widget>[
    Home(),
    pesananPage(),
    SimpleMap(),
    userProfile(),
  ];

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          //physics: const NeverScrollableScrollPhysics(),
          //controller: _pageController,
          //onPageChanged: onPageChanged,
          child: pages.elementAt(_page),
          //children: List.generate(4, (index) =>  pages[index] ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _page,
        onTap: onPageChanged,
        selectedItemColor: Constants.kPrimaryColor,
        unselectedItemColor: Constants.kPrimaryColor,
        //onTap: CircularNotchedRectangle(),
      ),
    );
  }

  //void navigationTapped(int page) {
  //  _pageController.jumpToPage(page);
  //}

  /* @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }*/

}
