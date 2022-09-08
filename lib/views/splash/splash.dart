import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/size_config.dart';
import '../onboarding/on_boarding.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Get.offAll(
              OnBoarding(),
              transition: Transition.downToUp,
              curve: Curves.fastOutSlowIn,
            ));
    return Scaffold(
      body: Container(
        child: Center(
          child: SvgPicture.asset(
            'assets/images/splashlogo.svg',
            height: SizeConfig.heightMultiplier * 10,
            width: SizeConfig.widthMultiplier * 5,
          ),
        ),
      ),
    );
  }
}
