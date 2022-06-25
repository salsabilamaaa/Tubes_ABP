import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubes_resto/pages/categories.dart';
import 'package:tubes_resto/pages/recommend.dart';
import 'package:tubes_resto/pages/resto.dart';
import 'package:tubes_resto/util/category.dart';
import 'package:tubes_resto/util/const.dart';
import 'package:tubes_resto/util/restaurants.dart';
import 'package:tubes_resto/widget/category_item.dart';
import 'package:tubes_resto/widget/recommend_item.dart';
import 'package:tubes_resto/widget/restaurant_item.dart';
import 'package:tubes_resto/widget/search_card.dart';
import 'package:http/http.dart' as http;
import 'package:tubes_resto/models/Resto.dart';

Future<List<Resto>> fetchResto(http.Client client, String token) async {
  final response =
      await client.get(Uri.parse('http://10.0.2.2:8000/api/resto'), headers: {
    'Accept': 'application/json',
  });
  return compute(parseResto, response.body);
}

List<Resto> parseResto(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Resto>((json) => Resto.fromJson(json)).toList();
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: ListView(
              children: <Widget>[
                buildSearchBar(context),
                SizedBox(height: 20.0),
                buildCategoryRow('Mau makan apa?', context),
                SizedBox(height: 10.0),
                buildCategoryList(context),
                SizedBox(height: 20.0),
                buildRecommendRow('Rekomendasi Restoran', context),
                SizedBox(height: 10.0),
                buildRecommendList(context),
                SizedBox(height: 20.0),
                buildRestaurantRow('Restoran Terdekat', context),
                SizedBox(height: 10.0),
                buildRestaurantList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildSearchBar(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0), child: SearchCard());
  }

  buildCategoryRow(String category, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$category",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "See all",
            style: TextStyle(
              color: Constants.kPrimaryColor,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Categories();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  buildCategoryList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 9,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories == null ? 0 : categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = categories[index];

          return CategoryItem(
            cat: cat,
          );
        },
      ),
    );
  }

  buildRecommendRow(String restaurant, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          restaurant,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "See all",
            style: TextStyle(
              color: Constants.kPrimaryColor,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const Recommended();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  buildRecommendList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.9,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: restaurants == null ? 0 : restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          Map restaurant = restaurants[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Recommend(
              img: restaurant["img"],
              title: restaurant["title"],
              category: restaurant["category"],
              rating: restaurant["rating"],
            ),
          );
        },
      ),
    );
  }

  buildRestaurantRow(String restaurant, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          restaurant,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "See all",
            style: TextStyle(
              color: Constants.kPrimaryColor,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const Restoran();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  buildRestaurantList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.9,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: restaurants == null ? 0 : restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          Map restaurant = restaurants[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SlideItem(
              img: restaurant["img"],
              title: restaurant["title"],
              category: restaurant["category"],
              rating: restaurant["rating"],
            ),
          );
        },
      ),
    );
  }
}
