import 'package:eatly_foodapp/modals/notificationdeliverymodal.dart';
import 'package:eatly_foodapp/utils/TextView.dart';
import 'package:eatly_foodapp/utils/size_config.dart';
import 'package:flutter/material.dart';

class Delivery extends StatelessWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: delivery_modal.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: DeliveryCard(
                image: delivery_modal[index].image,
                title: delivery_modal[index].title,
                subtile: delivery_modal[index].subtile,
                time: delivery_modal[index].time,
                subtilecolor: delivery_modal[index].subtilecolor),
          );
        },
      ),
    );
  }
}

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({
    Key? key,
    required this.image,
    required this.title,
    required this.subtile,
    required this.time,
    required this.subtilecolor,
  }) : super(key: key);
  final String image, title, subtile, time;
  final Color subtilecolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: SizeConfig.heightMultiplier * 10,
        width: SizeConfig.widthMultiplier * 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              height: SizeConfig.imageSizeMultiplier * 28,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: title,
                  size: SizeConfig.textMultiplier * 3,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                TextView(
                  text: subtile,
                  size: SizeConfig.textMultiplier * 1.8,
                  fontWeight: FontWeight.w400,
                  color: subtilecolor,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextView(
                text: time,
                size: SizeConfig.textMultiplier * 1.8,
                fontWeight: FontWeight.w400,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
