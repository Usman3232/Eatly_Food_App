import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../utils/aut_btn.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import '../../utils/style.dart';


class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                              Navigator.pop(context);
                            },
                          ),
                        )),
                  ),
                  Text(
                    'Address',
                    style: tileStyle,
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Deliver To',
                    style: titleStyle,
                  )),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
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
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 6,
                      vertical: SizeConfig.heightMultiplier * 1.5),
                  leading: Padding(

                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      "assets/images/AddressImages/location.png",
                      height: SizeConfig.heightMultiplier * 5.5,
                      fit: BoxFit.fill,
                    ),
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
                    borderRadius: BorderRadius.circular(12),
                  ),
                  subtitle: Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.heightMultiplier * .5),
                    child:
                        const Text("Horizenal Road Stree 1178 California, USA",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black26,
                            )),
                  ),
                  title: const Text("Home",
                      style: TextStyle(
                        fontSize: 18.0,
                        wordSpacing: 1,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              Card(
                elevation: 3,
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
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 6,
                      vertical: SizeConfig.heightMultiplier * 1.5),
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      "assets/images/AddressImages/location.png",
                      height: SizeConfig.heightMultiplier * 5.5,
                      fit: BoxFit.fill,
                    ),
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
                  subtitle: Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.heightMultiplier * .5),
                    child: const Text("Parallel Road Stree 897 California, USA",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black26,
                        )),
                  ),
                  title: const Text("Office",
                      style: TextStyle(
                        fontSize: 18.0,
                        wordSpacing: 1,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                ),
              ),
              Spacer(),
              CustomAuthButton(
                height: SizeConfig.heightMultiplier * 7,
                radius: 15.09,
                callback: () {
                  Get.to(const Address());
                },
                title: 'Use This Address',
                width: SizeConfig.widthMultiplier * 75,
                colour: AppColors.textfeildiconcolor,
              ),
              SizedBox(height: SizeConfig.heightMultiplier*1,),
              TextButton(onPressed: (){

              }, child: Text("+ Add  New  Adress",style: subtitleStyle,)),
              SizedBox(
                height: SizeConfig.heightMultiplier * 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
