import 'package:flutter/material.dart';

import '../../../utils/TextView.dart';
import '../../../utils/size_config.dart';

class CrauselCard extends StatelessWidget {
  const CrauselCard({
    Key? key,
    required this.image,
    required this.title,
    required this.percent,
    required this.containercolor,
  }) : super(key: key);
  final String image, title;
  final int percent;
  final Color containercolor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.heightMultiplier * 15,
          width: SizeConfig.widthMultiplier * 77,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: containercolor),
        ),
        Positioned(
          top: SizeConfig.heightMultiplier * 4,
          left: SizeConfig.widthMultiplier * 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: percent.toString() + '% OFF',
                size: SizeConfig.textMultiplier * 3,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 0.8,
              ),
              TextView(
                text: title,
                size: SizeConfig.textMultiplier * 1.8,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
        Positioned(
            right: SizeConfig.widthMultiplier * 7,
            bottom: SizeConfig.heightMultiplier * -1,
            child: Image.asset(
              image,
              height: SizeConfig.imageSizeMultiplier * 40,
            )),
      ],
    );
  }
}
