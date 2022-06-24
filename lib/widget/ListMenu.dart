import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  const ListMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: Text("Daftar Menu",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            height: 95,
            child: Row(
              children: [
                Container(
                  height: 65.0,
                  width: 65.0,
                  padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/food7.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ayam Bakar",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Text("Rp. 25.000")
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            height: 95,
            child: Row(
              children: [
                Container(
                  height: 65.0,
                  width: 65.0,
                  padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/food6.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ayam Bakar",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Text("Rp. 25.000")
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            height: 95,
            child: Row(
              children: [
                Container(
                  height: 65.0,
                  width: 65.0,
                  padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/food5.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ayam Bakar",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Text("Rp. 25.000")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
