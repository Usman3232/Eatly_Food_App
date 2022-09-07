
import 'package:eatly_foodapp/utils/style.dart';
import 'package:eatly_foodapp/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/aut_btn.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import 'addnewcard.dart';
import 'address.dart';

enum SingingCharacter { value1, value2, value3 }

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  SingingCharacter? _character;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
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
                              Get.back();
                            },
                          ),
                        )),
                  ),
                  Text(
                    'Paymnet Method',
                    style: tileStyle,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Payment Via',
                    style: titleStyle,
                  )),
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Container(
                height: SizeConfig.heightMultiplier * 9,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 3,
                    ),
                    Image.asset(
                      'assets/images/PaymentIcons/credit-card.png',
                      width: SizeConfig.widthMultiplier * 7,
                      height: SizeConfig.heightMultiplier * 2.5,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 5,
                    ),
                    Text(
                      'Credit Card',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Radio(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.hintstyleColor),
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                      activeColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.hintstyleColor),
                      value: SingingCharacter.value1,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              Container(
                height: SizeConfig.heightMultiplier * 9,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 3,
                    ),
                    Image.asset(
                      'assets/images/PaymentIcons/paypal.png',
                      width: SizeConfig.imageSizeMultiplier * 6,
                      height: SizeConfig.heightMultiplier * 3,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 6,
                    ),
                    const Text(
                      'PayPal',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                      value: SingingCharacter.value2,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              Container(
                height: SizeConfig.heightMultiplier * 9,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 3,
                    ),
                    Image.asset(
                      'assets/images/PaymentIcons/google.png',
                      width: SizeConfig.imageSizeMultiplier * 6,
                      height: SizeConfig.heightMultiplier * 3,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 6,
                    ),
                    Text(
                      'Google Pay',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                      value: SingingCharacter.value3,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Spacer(),
              ButtonTheme(
                height: SizeConfig.heightMultiplier * 7,
                minWidth: 120,
                child: CustomAuthButton(
                  height: SizeConfig.heightMultiplier * 7,
                  radius: 15.09,
                  callback: () {
                  // ignore: unrelated_type_equality_checks
                  if(SingingCharacter.value1 == _character) {
                    Get.off(const AddNewCard());
                  }else if(SingingCharacter.value2 == _character){
                    Get.to(const Address());


                  }else{
                    Get.offAll(Login());
                  }

                  },
                  title: 'Payment Method',
                  width: SizeConfig.widthMultiplier * 75,
                  colour: AppColors.textfeildiconcolor,
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
