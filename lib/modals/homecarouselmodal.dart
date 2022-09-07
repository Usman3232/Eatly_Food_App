import 'package:eatly_foodapp/utils/constants.dart';
import 'package:flutter/material.dart';

class CrauselModal {
  final String image, title;
  final int percent;
  final Color containercolor;

  CrauselModal(
      {required this.image,
      required this.title,
      required this.percent,
      required this.containercolor});
}

List<CrauselModal> crausel_modal = [
  CrauselModal(
      image: "assets/images/foodimage.png",
      title: "Daily Deals",
      percent: 50,
      containercolor: AppColors.primarycolor),
  CrauselModal(
      image: "assets/images/foodimage2.png",
      title: "Weakly Deals",
      percent: 70,
      containercolor: Color(0xffFDA7D0)),
  CrauselModal(
      image: "assets/images/foodimage.png",
      title: "Daily Deals",
      percent: 30,
      containercolor: AppColors.primarycolor)
];
