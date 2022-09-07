import 'package:eatly_foodapp/modals/homecarouselmodal.dart';
import 'package:eatly_foodapp/modals/homecategoriesmodal.dart';
import 'package:eatly_foodapp/modals/homemostpopularmodal.dart';
import 'package:eatly_foodapp/modals/homenearbyrestaurentmodal.dart';
import 'package:eatly_foodapp/utils/TextView.dart';
import 'package:eatly_foodapp/utils/auth_input_text_field.dart';
import 'package:eatly_foodapp/utils/constants.dart';
import 'package:eatly_foodapp/utils/size_config.dart';
import 'package:eatly_foodapp/views/mostpopular/mostpopular.dart';
import 'package:eatly_foodapp/views/nearbyrestaurants/nearbyrestaurants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'components/crauselcard.dart';
import 'components/homecatogriescard.dart';
import 'components/mostpopularcard.dart';
import 'components/nearbyrestaurentcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      3,
      (index) => CrauselCard(
        containercolor: crausel_modal[index].containercolor,
        image: crausel_modal[index].image,
        percent: crausel_modal[index].percent,
        title: crausel_modal[index].title,
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                          height: SizeConfig.heightMultiplier * 6.5,
                          width: SizeConfig.widthMultiplier * 13,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.menu,
                            color: Colors.black,
                          )),
                      Spacer(),
                      Container(
                        height: SizeConfig.heightMultiplier * 6.5,
                        width: SizeConfig.widthMultiplier * 13,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage('assets/images/me.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
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
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 19,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: pages.length,
                    itemBuilder: (_, index) {
                      return pages[index % pages.length];
                    },
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: pages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.primarycolor,
                      dotHeight: SizeConfig.heightMultiplier * 1,
                      dotWidth: SizeConfig.widthMultiplier * 4,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 6,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: homecatogries_modal.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: HomeCatogriesCard(
                            image: homecatogries_modal[index].image,
                            title: homecatogries_modal[index].title,
                            textcolor: homecatogries_modal[index].textcolor,
                            containercolor:
                                homecatogries_modal[index].containercolor),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Most Popular',
                        size: SizeConfig.textMultiplier * 3,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(MostPopular());
                        },
                        child: TextView(
                          text: 'see all',
                          size: SizeConfig.textMultiplier * 2,
                          color: Colors.black26,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 36,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: homemostpopular_modal.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: MostPopularCard(
                            image: homemostpopular_modal[index].image,
                            title: homemostpopular_modal[index].title,
                            foodstatustitle:
                                homemostpopular_modal[index].foodstatustitle,
                            foodstatuscontainercolor:
                                homemostpopular_modal[index]
                                    .foodstatuscontainercolor,
                            foodstatustitlecolor: homemostpopular_modal[index]
                                .foodstatustitlecolor,
                            time: homemostpopular_modal[index].time,
                            price: homemostpopular_modal[index].price,
                            checkstatus:
                                homemostpopular_modal[index].checkstatus,
                            rating: homemostpopular_modal[index].rating),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Nearby Restaurents',
                        size: SizeConfig.textMultiplier * 3,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(NearbyRestaurant());
                        },
                        child: TextView(
                          text: 'see all',
                          size: SizeConfig.textMultiplier * 2,
                          color: Colors.black26,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 30,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: nearbyrestaurent_modal.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
