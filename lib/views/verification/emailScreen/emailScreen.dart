import 'package:eatly_foodapp/utils/style.dart';
import 'package:eatly_foodapp/views/verification/emailScreen/verifyemail.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 15),
        body: SingleChildScrollView(
          child: Stack(

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: _formKey,
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
                                        builder: (_) => const ForgotPassword()));
                                  },
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Enter Your Email \nAddress",
                          style: registerStyle,
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: TextFormField(
                            style: TextStyle(
                              color: AppColors.textfeildiconcolor,
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
                                return Message("Please Enter Valid Email", context);
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                CupertinoIcons.mail,
                                color: AppColors.textfeildiconcolor,
                              ),
                              hintText: "Email Address",
                              labelStyle: const TextStyle(color: Colors.black),
                              contentPadding: const EdgeInsets.all(25),
                              enabledBorder: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color: AppColors.textfeildiconcolor,
                                      width: 2.5)),
                            ),
                          ),
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
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => VerifyEmail(
                                            email: emailController.text)));
                                  }
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
                                        "Verification",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: SizeConfig.textMultiplier*1.8

                                        ),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: NeumorphicButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (_) => Login()));
                                },
                                style: NeumorphicStyle(
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(15)),
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
                                            fontSize: SizeConfig.textMultiplier*1.8,
                                            fontWeight: FontWeight.w500

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
                ),
              ),
              Positioned(
                  right: 0,
                  child: Image.asset(
                    'assets/images/loginbg.png',
                    height: SizeConfig.imageSizeMultiplier * 60,
                    fit: BoxFit.fill,
                  ))
            ],
          ),
        ),
      ),
    );

  }
}
