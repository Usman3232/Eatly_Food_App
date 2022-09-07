import 'package:eatly_foodapp/utils/style.dart';
import 'package:eatly_foodapp/views/verification/phoneScreen/phoneScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../../login.dart';

class VerifyPhone extends StatefulWidget {
  VerifyPhone({Key? key, required this.number}) : super(key: key);
  var number;

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState(number);
}

class _VerifyPhoneState extends State<VerifyPhone> {
  _VerifyPhoneState(this.number);

  var number;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 20),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
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
                            Navigator.of(context).pop(MaterialPageRoute(
                                builder: (_) => const PhoneScreen()));
                          },
                        ),
                      )),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Verify Phone Number",
                            style: titleStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "We have Sent Code to Your Phone Number",
                            style: subtitleStyle,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(number.toString()),
                          const SizedBox(
                            height: 30,
                          ),
                          OTPTextField(
                            length: 4,
                            otpFieldStyle: OtpFieldStyle(
                              focusBorderColor: AppColors.textfeildiconcolor,

                            ),
                            width: MediaQuery.of(context).size.width,
                            fieldWidth: 50,
                            style:  TextStyle(
                                fontSize: SizeConfig.textMultiplier*2.2,fontWeight: FontWeight.w700, color: AppColors.textfeildiconcolor),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.box,
                            onCompleted: (pin) {
                              print("Completed: " + pin);
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: NeumorphicButton(
                                  onPressed: () {
                                    Get.to(Login());
                                  },
                                  style: NeumorphicStyle(
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(15)),
                                      color: AppColors.textfeildiconcolor,
                                      depth: 4,
                                      intensity: 2,
                                      surfaceIntensity: 2),
                                  child:  Center(
                                      child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      "Verify",
                                      style: TextStyle(

                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: NeumorphicButton(
                                  onPressed: () {},
                                  style: NeumorphicStyle(
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(15)),
                                      color: Color(0xffDBD9EE),
                                      depth: 4,
                                      intensity: 2,
                                      surfaceIntensity: 2),
                                  child:  Center(
                                      child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      "Send Again",
                                      style: TextStyle(
                                        color: AppColors.textfeildiconcolor
                                      ),
                                    ),
                                  )),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
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
