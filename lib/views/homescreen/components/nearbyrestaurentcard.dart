import 'package:flutter/material.dart';

import '../../../utils/TextView.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class HomeNearbyRestaurantCard extends StatefulWidget {
  HomeNearbyRestaurantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.statustext,
    required this.statustextcolor,
    required this.statuscontainercolor,
    required this.time,
    required this.checkstatus,
    required this.rating,
  }) : super(key: key);
  final String image, title, statustext;
  final Color statustextcolor, statuscontainercolor;
  final int time;
  final double rating;
  bool checkstatus;

  @override
  State<HomeNearbyRestaurantCard> createState() =>
      _HomeNearbyRestaurantCardState();
}

class _HomeNearbyRestaurantCardState extends State<HomeNearbyRestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 30,
      width: SizeConfig.widthMultiplier * 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 17,
            width: SizeConfig.widthMultiplier * 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              image: DecorationImage(
                  image: AssetImage(widget.image), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: SizeConfig.heightMultiplier * 2.5,
                  width: SizeConfig.widthMultiplier * 15,
                  decoration: BoxDecoration(
                    color: widget.statuscontainercolor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: TextView(
                      text: widget.statustext,
                      size: SizeConfig.textMultiplier * 1.6,
                      color: widget.statustextcolor,
                    ),
                  ),
                ),
                TextView(
                  text: widget.title,
                  size: SizeConfig.textMultiplier * 3,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    TextView(
                      text: widget.time.toString() + 'min   ',
                      size: SizeConfig.textMultiplier * 2,
                      color: Colors.black26,
                    ),
                    Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.primarycolor,
                      size: SizeConfig.imageSizeMultiplier * 6,
                    ),
                    TextView(
                      text: " " + widget.rating.toString(),
                      size: SizeConfig.textMultiplier * 2,
                      color: Colors.black26,
                    ),
                    Spacer(),
                    Container(
                      height: SizeConfig.heightMultiplier * 5,
                      width: SizeConfig.widthMultiplier * 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple.shade100,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            widget.checkstatus = !widget.checkstatus;
                          });
                        },
                        child: widget.checkstatus
                            ? Icon(
                                Icons.turned_in,
                                color: AppColors.primarycolor,
                              )
                            : Icon(Icons.turned_in_not),
                      ),
                    )
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
