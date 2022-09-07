import 'package:eatly_foodapp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryModal {
  final String image, title, subtile, time;
  final Color subtilecolor;

  DeliveryModal(
      {required this.image,
      required this.title,
      required this.subtile,
      this.subtilecolor = Colors.black,
      required this.time});
}

List<DeliveryModal> delivery_modal = [
  DeliveryModal(
      image: "assets/images/foodimage.png",
      title: 'Chicken Hell',
      subtile: "on the way",
      time: "3:09 PM"),
  DeliveryModal(
      image: "assets/images/foodimage2.png",
      title: 'Swe Dish',
      subtile: "on the way",
      time: "yesterday"),
  DeliveryModal(
      image: "assets/images/foodimage.png",
      title: 'Fish Hell Veg',
      subtile: "Canceled",
      subtilecolor: Colors.red,
      time: "yesterday"),
  DeliveryModal(
      image: "assets/images/foodimage2.png",
      title: 'Chicken Hell',
      subtile: "delivered",
      time: "3 days ago"),
  DeliveryModal(
      image: "assets/images/foodimage.png",
      title: 'Chicken Hell',
      subtile: "delivered",
      time: "8 days ago"),
];
