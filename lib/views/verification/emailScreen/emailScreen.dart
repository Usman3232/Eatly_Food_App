import 'package:eatly_foodapp/utils/style.dart';
import 'package:eatly_foodapp/views/verification/emailScreen/verifyemail.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../../utils/aut_btn.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../../../utils/widgets.dart';
import '../../forgotpassword.dart';
import '../../login.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  bool _isValid = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 3,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 13,
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
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: SizeConfig.imageSizeMultiplier * 6,
                                      color: Colors.black87,
                                    )),
                                onPressed: () {
                                  Navigator.of(context).pop(MaterialPageRoute(
                                      builder: (_) => const ForgotPassword()));
                                },
                              ),
                            )),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 5,
                      ),
                      Text(
                        "Enter Your Email \nAddress",
                        style: registerStyle,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 7,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            color: AppColors.primarycolor,
                            fontWeight: FontWeight.w600,
                          ),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            _isValid =
                                EmailValidator.validate(emailController.text);
                            if (emailController.text.isEmpty ||
                                _isValid == false) {
                              return Message(
                                  "Please Enter Valid Email", context);
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              CupertinoIcons.mail,
                              color: AppColors.primarycolor,
                            ),
                            hintText: "Email Address",
                            labelStyle: const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.all(25),
                            enabledBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: AppColors.primarycolor,
                                    width: 2.5)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 3,
                      ),
                      CustomAuthButton(
                        callback: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>
                                    VerifyEmail(email: emailController.text)));
                          }
                        },
                        colour: AppColors.primarycolor,
                        title: 'Verification',
                        fontSize: SizeConfig.textMultiplier * 2.5,
                        height: SizeConfig.heightMultiplier * 8,
                        width: SizeConfig.widthMultiplier * 100,
                        radius: 12,
                        textcolour: Colors.white,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      CustomAuthButton(
                        callback: () {
                          Get..to(Login());
                        },
                        colour: Color(0xffDBD9EE),
                        title: 'Later',
                        fontSize: SizeConfig.textMultiplier * 2.5,
                        height: SizeConfig.heightMultiplier * 8,
                        width: SizeConfig.widthMultiplier * 100,
                        radius: 12,
                        textcolour: AppColors.primarycolor,
                      ),
                    ],
                  ),
                ),
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
      ),
    );
  }
}
