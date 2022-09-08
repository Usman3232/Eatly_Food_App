import 'package:eatly_foodapp/controller/update_list.dart';
import 'package:eatly_foodapp/modals/addnewcard.dart';
import 'package:eatly_foodapp/utils/auth_input_text_field.dart';
import 'package:eatly_foodapp/utils/constants.dart';
import 'package:eatly_foodapp/utils/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../utils/aut_btn.dart';
import '../../utils/size_config.dart';
import '../../utils/style.dart';
import 'payment.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  String cardNumber = '**** **** **** ****';
  String cardHolderName = 'Name Here';
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
      mask: '**** **** **** ****',
      filter: {"*": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  var fourDigitFormat = MaskTextInputFormatter(
      mask: '**/**',
      filter: {"*": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  var threeDigitFormat = MaskTextInputFormatter(
      mask: '***',
      filter: {"*": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final _formKey = GlobalKey<FormState>();
  final _controller  = Get.put((ListController()));
  // final uhi = Get.put((ListController));

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
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
                                  Navigator.pop(context);
                                },
                              ),
                            )),
                      ),
                      Text(
                        'Add New Card',
                        style: tileStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5,
                  ),
                  Container(
                    height: SizeConfig.heightMultiplier * 25,
                    decoration: BoxDecoration(
                        color: Color(0xff323142),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 6,
                          decoration: BoxDecoration(
                              color: AppColors.primarycolor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(
                                  Icons.wallet_rounded,
                                  color: Colors.white,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.ellipsis,
                                  size: 25,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              cardNumber,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 4,
                              vertical: SizeConfig.heightMultiplier * 3),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Card Holder",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        height:
                                            SizeConfig.heightMultiplier * 0.5,
                                      ),
                                      Text(
                                        "$cardHolderName",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      )
                                    ],
                                  ),
                                  Image.asset(
                                    'assets/images/CardImages/mastercard.png',
                                    height: SizeConfig.heightMultiplier * 6,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter Information",
                        style: titleStyle,
                      )),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Card Number",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AuthTextInputField(
                      inputformatter: [maskFormatter],
                      textEditingController: cardNumberController,
                      textColor: AppColors.primarycolor,
                      hintText: 'Enter Card Number',
                      fillColor: Colors.white,
                      bordercolor: AppColors.primarycolor,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/CardImages/mastercard.png',
                          height: SizeConfig.heightMultiplier * 1,
                          width: SizeConfig.widthMultiplier * 1,
                          fit: BoxFit.fill,
                        ),
                      ),
                      radius: 12,
                      onChnage: (value) {
                        setState(() {
                          cardNumber = value;
                        });
                      },
                      inputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Card Holder",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AuthTextInputField(
                      textEditingController: cardHolderNameController,
                      textColor: AppColors.primarycolor,
                      hintText: 'Enter Card Holder Name',
                      fillColor: Colors.white,
                      bordercolor: AppColors.primarycolor,
                      radius: 12,
                      onChnage: (value) {
                        setState(() {
                          cardHolderName = value;
                        });
                      },
                      inputType: TextInputType.name,
                      maxlength: 16,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Expiration Date",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 25,
                        height: SizeConfig.heightMultiplier * 5,
                        child: AuthTextInputField(
                          inputformatter: [fourDigitFormat],
                          contentpadding: EdgeInsets.only(top: 5, left: 5),
                          textColor: AppColors.primarycolor,
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.hintstyleColor,
                          ),
                          hintText: '0',
                          fillColor: Colors.white,
                          bordercolor: AppColors.primarycolor,
                          radius: 8,
                          inputType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 25,
                        height: SizeConfig.heightMultiplier * 5,
                        child: AuthTextInputField(
                          contentpadding: EdgeInsets.only(top: 5, left: 5),
                          textColor: AppColors.primarycolor,
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.hintstyleColor,
                          ),
                          hintText: '0',
                          fillColor: Colors.white,
                          bordercolor: AppColors.primarycolor,
                          radius: 8,
                          inputType: TextInputType.name,
                          inputformatter: [fourDigitFormat],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 25,
                        height: SizeConfig.heightMultiplier * 5,
                        child: AuthTextInputField(
                          contentpadding: EdgeInsets.only(top: 5, left: 5),
                          textColor: AppColors.primarycolor,
                          suffixIcon: Icon(
                            Icons.help,
                            color: AppColors.hintstyleColor,
                          ),
                          hintText: '0',
                          inputformatter: [threeDigitFormat],
                          fillColor: Colors.white,
                          bordercolor: AppColors.primarycolor,
                          radius: 8,
                          inputType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 7,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 6 * SizeConfig.widthMultiplier),
                child: CustomAuthButton(
                  height: SizeConfig.heightMultiplier * 7,
                  width: SizeConfig.widthMultiplier * 0,
                  radius: 15.09,
                  callback: ()  {
                    if (cardHolderNameController.text.isEmpty &&
                        cardNumberController.text.isEmpty) {
                    Message('Please Enter Your Data', context);
                      } else {

                      _controller.updateCard(
                          NewCard(CardHolderNumber:cardNumberController.text.split(' ').last, CardHolderName: cardHolderNameController.text)
                      );
                      // setState(() {
                        // lstofWidget.add(AddCard());}
                      // );
                      Get.off(Payment());
                    }
                  },
                  title: 'Add Card',
                  colour: AppColors.primarycolor,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
          ],
        ),
      ),
    );
  }
}
