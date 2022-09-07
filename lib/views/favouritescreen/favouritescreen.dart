import 'package:eatly_foodapp/utils/TextView.dart';
import 'package:flutter/material.dart';

import '../../modals/homecategoriesmodal.dart';
import '../../modals/homemostpopularmodal.dart';
import '../../utils/auth_input_text_field.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import '../homescreen/components/homecatogriescard.dart';
import '../homescreen/components/mostpopularcard.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: TextView(
                    text: 'Most Favourite',
                    size: SizeConfig.textMultiplier * 3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
