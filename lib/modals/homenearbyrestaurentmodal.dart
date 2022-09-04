import 'package:flutter/cupertino.dart';

class NearbyRestaurentmodal {
  final String image, title, statustext;
  final Color statustextcolor, statuscontainercolor;
  final int time;
  final double rating;
  bool checkstatus;

  NearbyRestaurentmodal(
      {required this.image,
      required this.title,
      required this.statustext,
      required this.statustextcolor,
      required this.statuscontainercolor,
      required this.time,
      required this.rating,
      this.checkstatus = false});
}

List<NearbyRestaurentmodal> nearbyrestaurent_modal = [
  NearbyRestaurentmodal(
    image: 'assets/images/nearby1.jpg',
    title: 'The Chicken King',
    statustext: 'Healthy',
    statustextcolor: Color(0xffE1B547),
    statuscontainercolor: Color(0xffF6ECCF),
    time: 24,
    rating: 4.8,
  ),
  NearbyRestaurentmodal(
    image: 'assets/images/nearby2.jpg',
    title: 'The Biryani Expert',
    statustext: 'Trending',
    statustextcolor: Color(0xffFA6744),
    statuscontainercolor: Color(0xffF7C5BA),
    time: 19,
    rating: 2.8,
  ),
];
