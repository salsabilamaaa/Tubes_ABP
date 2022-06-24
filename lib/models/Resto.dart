import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tubes_resto/models/Menu.dart';

// List<Resto> pesananFromJson(String str)=>List<Resto>.from(jsonDecode(str).map((x)=>Resto.fromJson(x)));
// String pesananToJson(List<Resto> data)=>json.encode(List<dynamic>.from(data.map((x)=>x.toJson())));

class Resto {
  late int idResto;
  late String nameResto,
      username,
      open,
      image,
      alamat,
      kota,
      kecamatan,
      kodepos;
  late int minPeople, maxPeople;
  late List<Menu> listMenu;

  Resto(this.idResto, this.nameResto, this.open, this.minPeople, this.maxPeople,
      this.listMenu);

  static fromJson(json) {}

   factory Resto.fromJson(Map<String, dynamic> json) => Resto (
      idResto: json['resto_id'],
      nameResto: json['resto_id'],
      username: json['username'],
      image: json['image'] as String,
      alamat: json['alamat'],
      kota: json['kota'],
      kecamatan: json['kecamatan'],
      kodepos: json['username'],
      minPeople: json['username'],
      maxPeople: json['username'],
      listMenu: json['username'],
    );
}
