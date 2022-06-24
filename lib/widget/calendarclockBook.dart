import 'package:flutter/material.dart';
import 'package:tubes_resto/Models/DetailBooking.dart';

class calendarclockBook extends StatefulWidget {
  calendarclockBook({Key? key, required this.detailBook}) : super(key: key);

  DetailBooking detailBook;
  State<calendarclockBook> createState() => _calendarclockState();
}

class _calendarclockState extends State<calendarclockBook> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  late DetailBooking detailBook;

  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = "";
    detailBook = widget.detailBook;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          controller: dateinput,
          decoration: InputDecoration(
              icon: Icon(
                Icons.calendar_month_rounded,
                color: Color.fromARGB(255, 16, 75, 11),
              ),
              labelText: "Pilih Tanggal"),
          readOnly: true,
          onTap: () async {
            DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2030));
            if (picked != null) {
              setState(() {
                selectedDate = picked;
                detailBook.bookDate = selectedDate;
              });
            }
            dateinput.text = selectedDate.toString().substring(0, 10);
          },
        ),
      ),
      Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          controller: timeinput,
          decoration: InputDecoration(
              icon: Icon(
                Icons.watch_later_outlined,
                color: Color.fromARGB(255, 16, 75, 11),
              ),
              labelText: "Pilih Waktu"),
          readOnly: true,
          onTap: () async {
            TimeOfDay? newtime =
                await showTimePicker(context: context, initialTime: time);
            if (newtime != null) {
              setState(() {
                time = newtime;
                detailBook.bookTime = time;
              });
            }
            timeinput.text = time.toString().substring(10, 15);
          },
        ),
      )
    ]);
  }

  // _selectDate(BuildContext context) async {
  //   DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2000),
  //       lastDate: DateTime(2030));
  //   if (picked != null) {
  //     setState(() {
  //       selectedDate = picked;
  //       detailBook.bookDate = selectedDate;
  //     });
  //   }
  // }

  // _selectTime(BuildContext context) async {
  //   TimeOfDay? newtime =
  //       await showTimePicker(context: context, initialTime: time);
  //   if (newtime != null && newtime != time) {
  //     setState(() {
  //       time = newtime;
  //       detailBook.bookTime = time;
  //     });
  //   }
  // }
}
