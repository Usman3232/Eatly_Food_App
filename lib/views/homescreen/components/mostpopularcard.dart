import 'package:flutter/material.dart';

import '../../../utils/TextView.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class MostPopularCard extends StatefulWidget {
  MostPopularCard({
    Key? key,
    required this.image,
    required this.title,
    required this.foodstatustitle,
    required this.foodstatuscontainercolor,
    required this.foodstatustitlecolor,
    required this.time,
    required this.checkstatus,
    required this.price,
    required this.rating,
  }) : super(key: key);
  final String image, title, foodstatustitle;
  final Color foodstatuscontainercolor, foodstatustitlecolor;
  final int time;
  final double price, rating;
  bool checkstatus;

  @override
  State<MostPopularCard> createState() => _MostPopularCardState();
}

class _MostPopularCardState extends State<MostPopularCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 36,
      width: SizeConfig.widthMultiplier * 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 5),
        child: Stack(
          children: [
            Positioned(
              right: 7,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.checkstatus = !widget.checkstatus;
                    print(widget.checkstatus);
                  });
                },
                child: widget.checkstatus
                    ? Icon(
                        Icons.favorite,
                        color: AppColors.primarycolor,
                        size: SizeConfig.imageSizeMultiplier * 8,
                      )
                    : Icon(
                        Icons.favorite_border_outlined,
                        size: SizeConfig.imageSizeMultiplier * 8,
                      ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.image,
                  height: SizeConfig.imageSizeMultiplier * 37,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.heightMultiplier * 2.2,
                        width: SizeConfig.widthMultiplier * 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: widget.foodstatuscontainercolor),
                        child: Center(
                          child: TextView(
                            text: widget.foodstatustitle,
                            size: SizeConfig.textMultiplier * 1.5,
                            color: widget.foodstatustitlecolor,
                          ),
                        ),
                      ),
                      TextView(
                        text: widget.title,
                        size: SizeConfig.textMultiplier * 2.1,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1,
                      ),
                      Row(
                        children: [
                          TextView(
                            text: widget.time.toString() + 'min   ',
                            color: Colors.black26,
                            size: SizeConfig.textMultiplier * 1.8,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: AppColors.primarycolor,
                            size: SizeConfig.imageSizeMultiplier * 5,
                          ),
                          TextView(
                            text: widget.rating.toString(),
                            color: Colors.black26,
                            size: SizeConfig.textMultiplier * 1.8,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextView(
                            text: '\$' + widget.price.toString(),
                            size: SizeConfig.textMultiplier * 2.5,
                            fontWeight: FontWeight.w600,
                          ),
                          Spacer(),
                          Container(
                            height: SizeConfig.heightMultiplier * 5,
                            width: SizeConfig.widthMultiplier * 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black),
                            child: IconButton(
                              padding: EdgeInsets.only(right: 1),
                              onPressed: () {
                                setState(() {});
                                print("aaa");
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
