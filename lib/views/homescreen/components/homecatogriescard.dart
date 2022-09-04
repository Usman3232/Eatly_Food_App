import 'package:flutter/material.dart';

import '../../../utils/TextView.dart';
import '../../../utils/size_config.dart';

class HomeCatogriesCard extends StatelessWidget {
  const HomeCatogriesCard({
    Key? key,
    required this.image,
    required this.title,
    required this.textcolor,
    required this.containercolor,
  }) : super(key: key);
  final String image, title;
  final Color textcolor, containercolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 15,
      width: SizeConfig.widthMultiplier * 22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: containercolor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            image,
          ),
          TextView(
            text: title,
            size: SizeConfig.textMultiplier * 2,
            color: textcolor,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
