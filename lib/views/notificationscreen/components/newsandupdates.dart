import 'package:eatly_foodapp/utils/TextView.dart';
import 'package:eatly_foodapp/utils/size_config.dart';
import 'package:flutter/material.dart';

class NewsAndUpdates extends StatelessWidget {
  const NewsAndUpdates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: 'Points',
            size: SizeConfig.textMultiplier * 3,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2,
          ),
          Container(
            height: SizeConfig.heightMultiplier * 15,
            width: SizeConfig.widthMultiplier * 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'You Earned 70 Points',
                        size: SizeConfig.textMultiplier * 2.5,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1.2,
                      ),
                      TextView(
                        text:
                            ' Earned 100 Points And Get 50% Off Under\n \$100 Items.',
                        size: SizeConfig.textMultiplier * 1.5,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextView(
                      text: '3:09 PM',
                      size: SizeConfig.textMultiplier * 1.5,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2,
          ),
          Container(
            height: SizeConfig.heightMultiplier * 15,
            width: SizeConfig.widthMultiplier * 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'You Earned 20 Points',
                        size: SizeConfig.textMultiplier * 2.5,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1.2,
                      ),
                      TextView(
                        text:
                            ' Earned 100 Points And Get 50% Off Under\n \$100 Items.',
                        size: SizeConfig.textMultiplier * 1.5,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextView(
                      text: 'Yesterday',
                      size: SizeConfig.textMultiplier * 1.5,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 3,
          ),
          TextView(
            text: 'Points',
            size: SizeConfig.textMultiplier * 3,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2,
          ),
          Container(
            height: SizeConfig.heightMultiplier * 15,
            width: SizeConfig.widthMultiplier * 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Your App Is Fully Updated',
                        size: SizeConfig.textMultiplier * 2.5,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1.2,
                      ),
                      TextView(
                        text: 'Eatly App Version 7.89v Updated \nSuccesfully.',
                        size: SizeConfig.textMultiplier * 1.5,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextView(
                      text: 'Yesterday',
                      size: SizeConfig.textMultiplier * 1.5,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
