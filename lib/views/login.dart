import 'package:eatly_foodapp/utils/aut_btn.dart';
import 'package:eatly_foodapp/views/payment-screens/payment_method.dart';
import 'package:eatly_foodapp/views/register.dart';
import 'package:eatly_foodapp/views/verification/phoneScreen/phoneScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';
import '../utils/style.dart';
import '../utils/widgets.dart';
import 'forgotpassword.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isValid = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
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
                    Container(
                        child: Text(
                      'Login Your \nAccount',
                      textAlign: TextAlign.start,
                      style: registerStyle,
                    )),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 4.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        // elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                              color: AppColors.primarycolor,
                              fontWeight: FontWeight.w400),
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
                            hintText: "Enter your Email",
                            hintStyle: TextStyle(
                                color: AppColors.hintstyleColor,
                                fontWeight: FontWeight.w500),
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
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.heightMultiplier * 1),
                      child: Card(
                        // elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                              color: AppColors.primarycolor,
                              fontWeight: FontWeight.w400),
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
                                        color: AppColors.hintstyleColor,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: AppColors.primarycolor,
                                      )),
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: AppColors.primarycolor,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: AppColors.hintstyleColor,
                                fontWeight: FontWeight.w500),
                            labelStyle: const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.all(25),
                            enabledBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                    color: AppColors.primarycolor,
                                    width: 2)),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ForgotPassword()));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.grey[600],
                              letterSpacing: 0.7,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    CustomAuthButton(
                      callback: () {
                        if (_formKey.currentState!.validate()) {
                          Get.to(PhoneScreen());
                        }
                      },
                      colour: AppColors.primarycolor,
                      title: 'Login',
                      fontSize: SizeConfig.textMultiplier * 2.5,
                      height: SizeConfig.heightMultiplier * 8,
                      width: SizeConfig.widthMultiplier * 100,
                      radius: 12,
                      textcolour: Colors.white,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create New Account?",
                          style: TextStyle(
                              color: AppColors.hintstyleColor,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.textMultiplier * 2),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => Register()));
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 2,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1.8,
                    ),
                    Divider(
                      thickness: SizeConfig.heightMultiplier * .1,
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Continue with Accounts",
                          style: TextStyle(
                              color: AppColors.hintstyleColor,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.textMultiplier * 2),
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
                top: SizeConfig.heightMultiplier * 2,
                right: 0,
                child: Image.asset(
                  'assets/images/loginbg.png',
                  height: SizeConfig.imageSizeMultiplier * 60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
