import 'package:flutter/material.dart';
import 'package:tubes_resto/util/restaurants.dart';
import 'package:tubes_resto/widget/recommend_item.dart';
import '../util/const.dart';

class Recommended extends StatelessWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 3.0,
        title: const Text("Rekomendasi Restoran"),
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
                physics: const NeverScrollableScrollPhysics(),
                itemCount: restaurants == null ? 0 : restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  Map restaurant = restaurants[index];

                  return Recommend(
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
