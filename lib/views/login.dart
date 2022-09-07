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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.heightMultiplier*17,),
                    Container(
                        child: Text('Login Your \nAccount',textAlign: TextAlign.start,style: registerStyle,)),



                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                              color: AppColors.textfeildiconcolor,
                              fontWeight: FontWeight.w400),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            _isValid =
                                EmailValidator.validate(emailController.text);
                            if (emailController.text.isEmpty || _isValid == false) {
                              return Message("Please Enter Valid Email", context);
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail_outline_outlined,
                              color: AppColors.textfeildiconcolor,
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
                                    color: AppColors.textfeildiconcolor, width: 2)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                              color: AppColors.textfeildiconcolor,
                              fontWeight: FontWeight.w400),
                          controller: passwordController,
                          obscureText: obscurePassword,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value!.length < 8) {
                              return Message(
                                  "Password should be atlas 8 characters", context);
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
                                  color: AppColors.textfeildiconcolor,
                                )),
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: AppColors.textfeildiconcolor,
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
                                    color: AppColors.textfeildiconcolor, width: 2)),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
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
                            ))
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const PhoneScreen()));
                              }
                            },
                            style: NeumorphicStyle(
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(15)),
                                color: AppColors.textfeildiconcolor,
                                depth: 4,
                                intensity: 2,
                                surfaceIntensity: 2),
                            child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
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
                            "Create New Account?",
                            style: TextStyle(
                                color: AppColors.hintstyleColor,
                                fontWeight: FontWeight.w500,
                                fontSize: SizeConfig.textMultiplier * 2),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (_) => Register()));
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
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Divider(
                      thickness: 0.2,
                      color: AppColors.hintstyleColor,
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
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffEBC9C7)),
                              onPressed: () {
                                Get.to(const PaymentMethod());
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  "GOOGLE",
                                  style: TextStyle(
                                      color: Color(0xffD44638), fontSize: 16),
                                ),
                              )),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffC7D2E5)),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  "FACEBOOK",
                                  style: TextStyle(
                                      color: Color(0xff4267B2), fontSize: 16),
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: SizeConfig.heightMultiplier*2,
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
