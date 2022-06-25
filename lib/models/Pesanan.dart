import 'dart:convert';
import 'package:flutter/material.dart';

class Pesanan {
  final int idReservasi;
  final int resto_id;
  final int idCust;
  final String date_reservasi;
  final String time_reservasi;  
  final int no_table;

  const Pesanan({
    required this.idReservasi,
    required this.resto_id,
    required this.idCust,
    required this.date_reservasi,
    required this.time_reservasi,  
    required this.no_table,
  });

  factory Pesanan.fromJson(Map<String, dynamic> json) {
    return Pesanan(
      idReservasi: json['idReservasi'],
      resto_id: json['resto_id'],
      idCust: json['idCust'],
      date_reservasi: json['date_reservasi'] as String,
      time_reservasi: json['time_reservasi'] as String,
      no_table: json['no_table'],
    );
  }
}
