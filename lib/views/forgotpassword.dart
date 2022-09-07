import 'package:eatly_foodapp/utils/style.dart';
import 'package:eatly_foodapp/views/verification/emailScreen/emailScreen.dart';
import 'package:eatly_foodapp/views/verification/phoneScreen/phoneScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';
import '../utils/widgets.dart';
import 'login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isSelected1 = false;
  bool isSelected2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected1 = false;
    isSelected2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3.1,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 6,
                  width: SizeConfig.widthMultiplier * 12,
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
                                builder: (_) => const Login()));
                          },
                        ),
                      )),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 7,
                ),
                Text(
                  " Forget Password",
                  style: registerStyle,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Text(
                    "  Select which contact detail should we use\n  to reset your password",
                    style: TextStyle(
                      color: AppColors.hintstyleColor,
                      letterSpacing: 0.7,
                      fontSize: SizeConfig.textMultiplier * 1.7,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    )),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 6,
                ),
                Card(
                  // elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    focusColor: AppColors.textfeildiconcolor,
                    selectedColor: AppColors.textfeildiconcolor,
                    onTap: () {
                      setState(() {
                        isSelected1 = !isSelected1;
                        isSelected2 = false;
                      });
                    },
                    dense: true,
                    contentPadding: const EdgeInsets.all(5),
                    leading: Image.asset(
                      "assets/images/mail.png",
                    ),
                    shape: RoundedRectangleBorder(
                      side: isSelected1 == true
                          ? BorderSide(
                              color: AppColors.textfeildiconcolor,
                              width: 1.5,
                            )
                          : const BorderSide(
                              color: Colors.white,
                              width: 1.5,
                            ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    subtitle: const Text("Code Send to Your Email",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black26,
                        )),
                    title: const Text("Email",
                        style: TextStyle(
                          fontSize: 18.0,
                          wordSpacing: 1,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                Card(
                  // elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    focusColor: AppColors.textfeildiconcolor,
                    selectedColor: AppColors.textfeildiconcolor,
                    onTap: () {
                      setState(() {
                        isSelected2 = !isSelected2;
                        isSelected1 = false;
                      });
                    },
                    dense: true,
                    contentPadding: const EdgeInsets.all(5),
                    leading: Image.asset(
                      "assets/images/phone.png",
                    ),
                    shape: RoundedRectangleBorder(
                      side: isSelected2 == true
                          ? BorderSide(
                              color: AppColors.textfeildiconcolor,
                              width: 1.5,
                            )
                          : const BorderSide(
                              color: Colors.white,
                              width: 1.5,
                            ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    subtitle: const Text("Code Send to Your Phone",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black26,
                        )),
                    title: const Text("Phone",
                        style: TextStyle(
                          fontSize: 18.0,
                          wordSpacing: 1,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: NeumorphicButton(
                        onPressed: () {
                          if (isSelected1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EmailScreen()));
                          } else if (isSelected2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const PhoneScreen()));
                          } else {
                            Message("Please Select One of them", context);
                          }
                        },
                        style: NeumorphicStyle(
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(8)),
                            color: AppColors.textfeildiconcolor,
                            depth: 4,
                            intensity: 2,
                            surfaceIntensity: 2),
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: SizeConfig.textMultiplier * 2),
                          ),
                        )),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              top: SizeConfig.heightMultiplier * 2,
              right: 0,
              child: Image.asset(
                'assets/images/loginbg.png',
                height: SizeConfig.imageSizeMultiplier * 60,
                fit: BoxFit.fill,
              ))
        ],
      ),
    );
  }
}
