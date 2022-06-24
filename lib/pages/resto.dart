import 'package:flutter/material.dart';
import 'package:tubes_resto/util/restaurants.dart';
import 'package:tubes_resto/widget/restaurant_item.dart';
import '../util/const.dart';

class Resto extends StatelessWidget {
  const Resto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Restoran Terdekat"),
        centerTitle: true,
        backgroundColor: Constants.kPrimaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 10.0,
          ),
          child: ListView(
            children: <Widget>[
              //SearchCard(),
              const SizedBox(height: 10.0),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: restaurants == null ? 0 : restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  Map restaurant = restaurants[index];

                  return SlideItem(
                    img: restaurant["img"],
                    title: restaurant["title"],
                    category: restaurant["category"],
                    rating: restaurant["rating"],
                  );
                },
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
