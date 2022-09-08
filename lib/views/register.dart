import 'package:eatly_foodapp/views/bottom_navigation/bottom_navigation_tab.dart';
import 'package:eatly_foodapp/views/payment-screens/payment_method.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/aut_btn.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';
import '../utils/style.dart';
import '../utils/widgets.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isValid = false;
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 17,
                    ),
                    Text(
                      'Create Your \nAccount',
                      style: registerStyle,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                              color: AppColors.primarycolor,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.textMultiplier * 2),
                          controller: usernameController,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return Message("Please Enter your name", context);
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline_rounded,
                              color: AppColors.primarycolor,
                            ),
                            hintText: 'Full Name',
                            labelStyle: const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.all(25),
                            enabledBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: AppColors.primarycolor,
                                    width: SizeConfig.heightMultiplier * .3)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            color: AppColors.primarycolor,
                            fontSize: SizeConfig.textMultiplier * 2,
                            fontWeight: FontWeight.w500,
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
                              Icons.mail_outline_outlined,
                              color: AppColors.primarycolor,
                            ),
                            hintText: 'Enter Your Email',
                            labelStyle: const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.all(25),
                            enabledBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: AppColors.primarycolor,
                                    width: SizeConfig.heightMultiplier * .3)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            color: AppColors.primarycolor,
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.textMultiplier * 2,
                          ),
                          controller: passwordController,
                          obscureText: obscurePassword,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value!.length < 8) {
                              return Message(
                                  "Password should be atlas 8 characters",
                                  context);
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  obscurePassword = !obscurePassword;
                                  setState(() {});
                                },
                                child: obscurePassword == true
                                    ? Icon(
                                        Icons.visibility_off_outlined,
                                        color: Colors.grey[500],
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: AppColors.primarycolor,
                                      )),
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: AppColors.primarycolor,
                            ),
                            hintText: 'Password',
                            labelStyle: const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.all(25),
                            enabledBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: AppColors.primarycolor,
                                    width: SizeConfig.heightMultiplier * .3)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: NeumorphicButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.to(BottomBar());
                              }
                            },
                            style: NeumorphicStyle(
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(15)),
                                color: AppColors.primarycolor,
                                depth: 4,
                                intensity: 2,
                                surfaceIntensity: 2),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: SizeConfig.textMultiplier * 1.8),
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already Have An Account?',
                            style: subtitleStyle,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (_) => Login()));
                              },
                              child: Text(
                                "Sign In".tr,
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 2,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ))
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: SizeConfig.heightMultiplier * 1,
                    // ),
                    Divider(
                      thickness: SizeConfig.heightMultiplier * .1,
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Continue With Accounts',
                          style: subtitleStyle,
                        )),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomAuthButton(
                          callback: () {
                            Get.to(const PaymentMethod());
                          },
                          colour: Color(0xffEBC9C7),
                          title: 'Google',
                          fontSize: SizeConfig.textMultiplier * 2,
                          height: SizeConfig.heightMultiplier * 6,
                          width: SizeConfig.widthMultiplier * 42.5,
                          radius: 6,
                          textcolour: Color(0xffD44638),
                        ),
                        CustomAuthButton(
                          callback: () {
                            // Get.to(const PaymentMethod());
                          },
                          colour: Color(0xffC7D2E5),
                          title: 'FACEBOOK',
                          fontSize: SizeConfig.textMultiplier * 2,
                          height: SizeConfig.heightMultiplier * 6,
                          width: SizeConfig.widthMultiplier * 42.5,
                          radius: 6,
                          textcolour: Color(0xff4267B2),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  right: 0,
                  child: Image.asset(
                    'assets/images/loginbg.png',
                    height: SizeConfig.imageSizeMultiplier * 60,
                    // height:SizeConfig.heightMultiplier*15,
                    // fit: BoxFit.fill,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
