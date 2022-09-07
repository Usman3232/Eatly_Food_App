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
  bool obscurePassword=true;
  @override
  Widget build(BuildContext context) {
    return         SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 10),

        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
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
                                  Navigator.of(context).pop();
                                },
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Reset Your \nPassword",
                        style: registerStyle,
                        // style: registerStyle,
                      ),
                      const SizedBox(height: 70,),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          textInputAction: TextInputAction.done,

                          validator: (value) {
                            if (value!.length < 8) {
                              return Message("Password should be atlas 8 characters", context);
                            }
                          },
                          decoration:   InputDecoration(
                            suffixIcon: InkWell(
                                onTap: (){
                                  obscurePassword=!obscurePassword;
                                  setState((){

                                  });
                                },
                                child:obscurePassword==true?  Icon(Icons.visibility_off_outlined,color: Colors.grey[500],)
                                    :  Icon(Icons.visibility,color: AppColors.textfeildiconcolor,)),
                            prefixIcon:  Icon(Icons.lock_outline_rounded,color:AppColors.textfeildiconcolor,),
                            hintText: "Password",
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
                      const SizedBox(height: 10,),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextFormField(
                          controller: cPasswordController,
                          obscureText: obscurePassword,
                          textInputAction: TextInputAction.done,

                          validator: (value) {
                            if (value!.length < 8) {
                              return Message("Password should be atlas 8 characters", context);
                            }
                          },
                          decoration:   InputDecoration(
                            suffixIcon: InkWell(
                                onTap: (){
                                  obscurePassword=!obscurePassword;
                                  setState((){

                                  });
                                },
                                child:obscurePassword==true?  Icon(Icons.visibility_off_outlined,color: Colors.grey[500])
                                    :  Icon(Icons.visibility,color: AppColors.textfeildiconcolor,)),
                            prefixIcon:  Icon(Icons.lock_outline_rounded,color: AppColors.textfeildiconcolor,),
                            hintText: "Confirm Password",
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
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: NeumorphicButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if(cPasswordController.text!=passwordController.text){
                                    return Message("Incorrect Password", context);
                                  }
                                  else {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Login()));

                                  }
                                }
                              },
                              style:  NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                                  color: AppColors.textfeildiconcolor,
                                  depth: 4,
                                  intensity: 2,
                                  surfaceIntensity: 2),
                              child:  Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      "Reset",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeConfig.textMultiplier*1.8,),
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
                )),
          ],
        ),
      ),
    );

  }
}
