import 'package:eatly_foodapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import '../../utils/widgets.dart';
import '../login.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController cPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                                Navigator.of(context).pop();
                              },
                            ),
                          )),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 5,
                    ),
                    Text(
                      "Reset Your \nPassword",
                      style: registerStyle,
                      // style: registerStyle,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 7,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
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
                          hintText: "Password",
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
                      height: SizeConfig.heightMultiplier * 1,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
                        controller: cPasswordController,
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
                                  ? Icon(Icons.visibility_off_outlined,
                                      color: Colors.grey[500])
                                  : Icon(
                                      Icons.visibility,
                                      color: AppColors.primarycolor,
                                    )),
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppColors.primarycolor,
                          ),
                          hintText: "Confirm Password",
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
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: NeumorphicButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (cPasswordController.text !=
                                    passwordController.text) {
                                  return Message("Incorrect Password", context);
                                } else {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => Login()));
                                }
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
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Reset",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeConfig.textMultiplier * 1.8,
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
              top: SizeConfig.heightMultiplier * 2,
              child: Image.asset(
                'assets/images/loginbg.png',
                height: SizeConfig.imageSizeMultiplier * 60,
                fit: BoxFit.fill,
              )),
        ],
      ),
    );
  }
}
