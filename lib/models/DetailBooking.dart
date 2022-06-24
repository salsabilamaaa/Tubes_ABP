import "package:flutter/material.dart";
import 'package:tubes_resto/Models/Menu.dart';

class DetailBooking {
  late int bookId;
  int people = 1;
  final String resto;
  late DateTime bookDate;
  late TimeOfDay bookTime;
  late List<Menu> bookMenu;
  late String methodPayment;

  DetailBooking(this.resto);
  setDateTimePeople(int people, DateTime bookDate, TimeOfDay bookTime) {
    this.people = people;
    this.bookDate = bookDate;
    this.bookTime = bookTime;
  }

  setMenu(List<Menu> menu) {
    bookMenu = menu;
  }
}
