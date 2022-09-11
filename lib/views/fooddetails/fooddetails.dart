import 'package:eatly_foodapp/modals/fooddetailingrediantsmodal.dart';
import 'package:eatly_foodapp/utils/TextView.dart';
import 'package:eatly_foodapp/utils/aut_btn.dart';
import 'package:eatly_foodapp/utils/constants.dart';
import 'package:eatly_foodapp/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({Key? key, required this.product}) : super(key: key);
  final product;

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

int number = 0;

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: SizeConfig.heightMultiplier * 40,
                  width: SizeConfig.widthMultiplier * 100,
                  color: Color(0xffD8D7EA),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.heightMultiplier * 4,
                        right: SizeConfig.widthMultiplier * 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.primarycolor,
                            size: SizeConfig.imageSizeMultiplier * 7,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.heightMultiplier * 1),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                widget.product.checkstatus =
                                    !widget.product.checkstatus;
                              });
                            },
                            child: widget.product.checkstatus
                                ? Icon(
                                    Icons.favorite_outline,
                                    size: SizeConfig.imageSizeMultiplier * 7,
                                    color: AppColors.primarycolor,
                                  )
                                : Icon(
                                    Icons.favorite_outlined,
                                    color: AppColors.primarycolor,
                                    size: SizeConfig.imageSizeMultiplier * 7,
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.heightMultiplier * 7,
                      right: SizeConfig.widthMultiplier * 5,
                      left: SizeConfig.widthMultiplier * 5,
                      bottom: SizeConfig.heightMultiplier * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: widget.product.title,
                                size: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.w600,
                              ),
                              Row(
                                children: [
                                  TextView(
                                    text: widget.product.time.toString() +
                                        'min   ',
                                    color: Colors.black26,
                                    size: SizeConfig.textMultiplier * 1.8,
                                  ),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: AppColors.primarycolor,
                                    size: SizeConfig.imageSizeMultiplier * 5,
                                  ),
                                  TextView(
                                    text:
                                        widget.product.rating.toString() + " ",
                                    color: Colors.black26,
                                    size: SizeConfig.textMultiplier * 1.8,
                                  ),
                                  Icon(
                                    Icons.local_fire_department_sharp,
                                    color: Color(0xffF9998A),
                                    size: SizeConfig.imageSizeMultiplier * 5,
                                  ),
                                  TextView(
                                    text: '456 Kcal',
                                    color: Colors.black26,
                                    size: SizeConfig.textMultiplier * 1.8,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: SizeConfig.heightMultiplier * 5,
                            width: SizeConfig.widthMultiplier * 20,
                            decoration: BoxDecoration(
                                color: AppColors.primarycolor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: SizeConfig.heightMultiplier * 2),
                                  child: InkWell(
                                    onTap: () {
                                      if (number == 0) {
                                        setState(() {
                                          number = number;
                                        });
                                      } else {
                                        setState(() {
                                          number = number - 1;
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.minimize,
                                      size: SizeConfig.imageSizeMultiplier * 6,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                TextView(
                                  text: number.toString(),
                                  size: SizeConfig.textMultiplier * 1.8,
                                  color: Colors.white,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      number = number + 1;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: SizeConfig.imageSizeMultiplier * 6,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      Container(
                        height: SizeConfig.heightMultiplier * 2.2,
                        width: SizeConfig.widthMultiplier * 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: widget.product.foodstatuscontainercolor),
                        child: Center(
                          child: TextView(
                            text: widget.product.foodstatustitle,
                            size: SizeConfig.textMultiplier * 1.5,
                            color: widget.product.foodstatustitlecolor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 3,
                      ),
                      TextView(
                        text: 'Description',
                        size: SizeConfig.textMultiplier * 2.2,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      TextView(
                        text:
                            'Chicken Hell Is The Healthies Chicken For Gym Guys And Girls. It Promote Healthy Life Style And Make Your Energy Booster.',
                        size: SizeConfig.textMultiplier * 1.8,
                        color: Colors.black38,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 3,
                      ),
                      TextView(
                        text: 'Ingrediants',
                        size: SizeConfig.textMultiplier * 2.2,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 7,
                        child: ListView.builder(
                          itemCount: fooddetailingredients_modal.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.widthMultiplier * 2),
                              child: IngrediantsCard(
                                  color:
                                      fooddetailingredients_modal[index].color,
                                  image:
                                      fooddetailingredients_modal[index].image),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: "\$" + widget.product.price.toString(),
                            size: SizeConfig.textMultiplier * 3,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomAuthButton(
                            callback: () {},
                            height: SizeConfig.heightMultiplier * 8,
                            width: SizeConfig.widthMultiplier * 55,
                            colour: AppColors.primarycolor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            title: 'Add To Cart',
                            textcolour: Colors.white,
                            radius: 12,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: SizeConfig.heightMultiplier * 16,
              left: SizeConfig.widthMultiplier * 15,
              child: Image.asset(
                widget.product.image,
                height: SizeConfig.imageSizeMultiplier * 70,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IngrediantsCard extends StatelessWidget {
  const IngrediantsCard({
    Key? key,
    required this.color,
    required this.image,
  }) : super(key: key);
  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 7,
      width: SizeConfig.widthMultiplier * 14,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(
        image,
        // height: SizeConfig.imageSizeMultiplier*10,
      ),
    );
  }
}
