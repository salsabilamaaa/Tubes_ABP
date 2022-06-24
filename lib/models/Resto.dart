import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tubes_resto/models/Menu.dart';

// List<Resto> pesananFromJson(String str)=>List<Resto>.from(jsonDecode(str).map((x)=>Resto.fromJson(x)));
// String pesananToJson(List<Resto> data)=>json.encode(List<dynamic>.from(data.map((x)=>x.toJson())));

class Resto {
  final int idResto;
  final String nameResto, username, image, alamat, kota, kecamatan, kodepos;
  // String open = "09.00 - 22.00";
  // int minPeople, maxPeople;
  // late List<Menu> listMenu;
  final String category;

  const Resto(
      {required this.idResto,
      required this.nameResto,
      required this.username,
      required this.image,
      required this.alamat,
      required this.kota,
      required this.kecamatan,
      required this.kodepos,
      required this.category});
  // static fromJson(json) {}

  factory Resto.fromJson(Map<String, dynamic> json) {
    return Resto(
        idResto: json['id'] as int,
        nameResto: json['nama'] as String,
        username: json['username'] as String,
        image: json['image'] as String,
        alamat: json['alamat'] as String,
        kota: json['kota'] as String,
        kecamatan: json['kecamatan'] as String,
        kodepos: json['username'] as String,
        category: json['kategori'] as String);
  }
}
