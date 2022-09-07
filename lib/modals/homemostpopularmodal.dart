import 'package:flutter/cupertino.dart';

class HomeMostPopularModal {
  final String image, title, foodstatustitle;
  final Color foodstatuscontainercolor, foodstatustitlecolor;
  final int time;
  final double price, rating;
  bool checkstatus;

  HomeMostPopularModal(
      {required this.image,
      this.checkstatus = false,
      required this.title,
      required this.foodstatustitle,
      required this.foodstatuscontainercolor,
      required this.foodstatustitlecolor,
      required this.time,
      required this.price,
      required this.rating});
}

List<HomeMostPopularModal> homemostpopular_modal = [
  HomeMostPopularModal(
    image: 'assets/images/foodimage.png',
    title: 'Chicken Hell',
    foodstatustitle: 'Healthy',
    foodstatuscontainercolor: Color(0xffF6ECCF),
    foodstatustitlecolor: Color(0xffE1B547),
    time: 24,
    price: 12.99,
    rating: 4.8,
  ),
  HomeMostPopularModal(
    image: 'assets/images/foodimage2.png',
    title: 'Swe Dish',
    foodstatustitle: 'Trending',
    foodstatuscontainercolor: Color(0xffF7C5BA),
    foodstatustitlecolor: Color(0xffFA6744),
    time: 31,
    price: 19.99,
    rating: 4.9,
  ),
  HomeMostPopularModal(
    image: 'assets/images/foodimage.png',
    title: 'Chicken Master',
    foodstatustitle: 'Healthy',
    foodstatuscontainercolor: Color(0xffF6ECCF),
    foodstatustitlecolor: Color(0xffE1B547),
    time: 19,
    price: 5.99,
    rating: 3.9,
  ),
  HomeMostPopularModal(
    image: 'assets/images/foodimage.png',
    title: 'Chicken Master',
    foodstatustitle: 'Healthy',
    foodstatuscontainercolor: Color(0xffF6ECCF),
    foodstatustitlecolor: Color(0xffE1B547),
    time: 21,
    price: 1.99,
    rating: 2.9,
  ),
  HomeMostPopularModal(
    image: 'assets/images/foodimage2.png',
    title: 'Chicken Master',
    foodstatustitle: 'Healthy',
    foodstatuscontainercolor: Color(0xffF6ECCF),
    foodstatustitlecolor: Color(0xffE1B547),
    time: 15,
    price: 9.99,
    rating: 4.1,
  ),
  HomeMostPopularModal(
    image: 'assets/images/foodimage.png',
    title: 'Chicken Master',
    foodstatustitle: 'Healthy',
    foodstatuscontainercolor: Color(0xffF6ECCF),
    foodstatustitlecolor: Color(0xffE1B547),
    time: 78,
    price: 4.99,
    rating: 4.9,
  ),
];
