import 'package:eatly_foodapp/utils/style.dart';
import 'package:eatly_foodapp/views/verification/phoneScreen/verifyPhone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../../../utils/widgets.dart';
import '../../forgotpassword.dart';
import '../../login.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();
  var maskFormatter =  MaskTextInputFormatter(
      mask: '+00 0000000 000',
      filter: { "0": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 15),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
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
                                    builder: (_) => const ForgotPassword()));
                              },
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Enter Your Phone \nNumber",
                      style: registerStyle,
                    ),
                    SizedBox(height: 70,),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
                        inputFormatters: [
                          maskFormatter
                        ],
                        controller: phoneController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.length < 8) {
                            return Message("Enter Your Phone Number", context);
                          }
                        },
                        style: TextStyle(color: AppColors.textfeildiconcolor),
                        decoration:   InputDecoration(

                          prefixIcon:   Icon(CupertinoIcons.phone,color: AppColors.textfeildiconcolor,),
                          hintText: "+00 000000 000",
                          labelStyle: const TextStyle(color: Colors.black),
                          contentPadding: const EdgeInsets.all(25),
                          enabledBorder: InputBorder.none,
                          focusedBorder:
                          OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(15.0),
                              borderSide:   BorderSide(color: AppColors.textfeildiconcolor,width: 2.5 )
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: NeumorphicButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>VerifyPhone(number: phoneController.text)));
                              },
                              style:  NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                                  color:AppColors.textfeildiconcolor,
                                  depth: 4,
                                  intensity: 2,
                                  surfaceIntensity: 2),
                              child:  Center(
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                      "Verification",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeConfig.textMultiplier*1.8
                                      )),
                                ),
                              )),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: NeumorphicButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=> Login()));
                            },
                            style:  NeumorphicStyle(
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                                color: const Color(0xffDBD9EE),
                                depth: 4,
                                intensity: 2,
                                surfaceIntensity: 2),
                            child:  Center(
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    "Later",
                                    style: TextStyle(
                                        color: AppColors.textfeildiconcolor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeConfig.textMultiplier*1.8
                                    ),
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
                right: 0,
                child: Image.asset(
                  'assets/images/loginbg.png',
                  height: SizeConfig.imageSizeMultiplier * 60,
                  fit: BoxFit.fill,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
