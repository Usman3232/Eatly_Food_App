import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCategoriesModal {
  final String image, title;
  final Color textcolor, containercolor;

  HomeCategoriesModal(
      {required this.image,
      required this.title,
      required this.textcolor,
      required this.containercolor});
}

List<HomeCategoriesModal> homecatogries_modal = [
  HomeCategoriesModal(
    image: "assets/images/Pizza.png",
    title: "Pizza",
    textcolor: Color(0xffD69900),
    containercolor: Color(0xffF7EDD0),
  ),
  HomeCategoriesModal(
    image: "assets/images/Hotdog.png",
    title: "Asian",
    textcolor: Color(0xffFB471D),
    containercolor: Color(0xffF7C5BA),
  ),
  HomeCategoriesModal(
    image: "assets/images/Doughnut.png",
    title: "Donat",
    textcolor: Color(0xffE28B14),
    containercolor: Color(0xffF1DFC5),
  ),
  HomeCategoriesModal(
    image: "assets/images/Icecream.png",
    title: "Ice",
    textcolor: Color(0xff002072),
    containercolor: Color(0xffBDCEF9),
  ),
   HomeCategoriesModal(
    image: "assets/images/Doughnut.png",
    title: "Burger",
    textcolor: Colors.green,
    containercolor: Color(0xffB2DCC4),
  ),
];
