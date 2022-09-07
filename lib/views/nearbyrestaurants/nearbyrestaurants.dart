import 'package:eatly_foodapp/views/homescreen/components/nearbyrestaurentcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../modals/homenearbyrestaurentmodal.dart';
import '../../utils/TextView.dart';
import '../../utils/auth_input_text_field.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';

class NearbyRestaurant extends StatelessWidget {
  const NearbyRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(20)),
                            depth: 4,
                            lightSource: LightSource.topLeft,
                            color: Colors.white),
                        child: Center(
                          child: IconButton(
                            icon: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: Colors.black87,
                                )),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ),
                    ),
                    TextView(
                      text: "Nearby Resturents",
                      size: SizeConfig.textMultiplier * 2.5,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AuthTextInputField(
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black54,
                        ),
                        radius: 16,
                        bordercolor: Colors.transparent,
                        cursorColor: Colors.black,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 2,
                    ),
                    Container(
                      height: SizeConfig.heightMultiplier * 7.5,
                      width: SizeConfig.widthMultiplier * 15,
                      decoration: BoxDecoration(
                        color: AppColors.primarycolor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 90,
                  child: ListView.builder(
                    itemCount: nearbyrestaurent_modal.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: HomeNearbyRestaurantCard(
                            image: nearbyrestaurent_modal[index].image,
                            title: nearbyrestaurent_modal[index].title,
                            statustext:
                                nearbyrestaurent_modal[index].statustext,
                            statustextcolor:
                                nearbyrestaurent_modal[index].statustextcolor,
                            statuscontainercolor: nearbyrestaurent_modal[index]
                                .statuscontainercolor,
                            time: nearbyrestaurent_modal[index].time,
                            checkstatus:
                                nearbyrestaurent_modal[index].checkstatus,
                            rating: nearbyrestaurent_modal[index].rating),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
