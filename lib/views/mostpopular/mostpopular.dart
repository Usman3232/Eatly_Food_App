import 'package:eatly_foodapp/utils/TextView.dart';
import 'package:eatly_foodapp/utils/size_config.dart';
import 'package:eatly_foodapp/views/homescreen/components/mostpopularcard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../modals/homemostpopularmodal.dart';
import '../../utils/auth_input_text_field.dart';
import '../../utils/constants.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier*6,
                      width: SizeConfig.widthMultiplier*13,
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
                      text: "Most Popular Foods",
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
                Container(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homemostpopular_modal.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      
                        childAspectRatio: SizeConfig.heightMultiplier * .075,
                        mainAxisSpacing: SizeConfig.heightMultiplier * 2,
                        crossAxisSpacing: SizeConfig.widthMultiplier * 4,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return MostPopularCard(
                          image: homemostpopular_modal[index].image,
                          title: homemostpopular_modal[index].title,
                          foodstatustitle:
                              homemostpopular_modal[index].foodstatustitle,
                          foodstatuscontainercolor: homemostpopular_modal[index]
                              .foodstatuscontainercolor,
                          foodstatustitlecolor:
                              homemostpopular_modal[index].foodstatustitlecolor,
                          time: homemostpopular_modal[index].time,
                          checkstatus: homemostpopular_modal[index].checkstatus,
                          price: homemostpopular_modal[index].price,
                          rating: homemostpopular_modal[index].rating);
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
