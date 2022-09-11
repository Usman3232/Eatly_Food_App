import 'package:dots_indicator/dots_indicator.dart';
import 'package:eatly_foodapp/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/TextView.dart';
import '../../../utils/size_config.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final _controller = PageController();
  int selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        children: [


          Positioned(
              top: SizeConfig.heightMultiplier * 18.5,
              child: Image.asset("assets/images/BoardingImages/food1.png",
                  width: SizeConfig.widthMultiplier * 95, fit: BoxFit.fill)),
          Positioned(
            bottom: SizeConfig.heightMultiplier * 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextView(
                      text: 'Find Foods ',
                      color: Colors.black,
                      size: SizeConfig.textMultiplier * 3.2,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 0.5,
                    ),
                    TextView(
                      text: 'With Best Of Love',
                      size: SizeConfig.textMultiplier * 2.8,
                      color: const Color(0xffACADB9),
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.poppins().toString(),

                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        children: [

          Positioned(
              top: SizeConfig.heightMultiplier * 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/BoardingImages/food2.png",
                      width: SizeConfig.widthMultiplier * 85, fit: BoxFit.fill),
                ],
              )),
          Positioned(
            bottom: SizeConfig.heightMultiplier * 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextView(
                      text: 'Fast Delivery',
                      color: Colors.black,
                      size: SizeConfig.textMultiplier * 3.2,
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.poppins().toString(),

                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 0.5,
                    ),
                    TextView(
                      text: 'With Super Riders',
                      size: SizeConfig.textMultiplier * 2.8,
                      color: const Color(0xffACADB9),
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.poppins().toString(),

                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        children: [

          Positioned(
              top: SizeConfig.heightMultiplier * 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/BoardingImages/food3.png",
                      width: SizeConfig.widthMultiplier * 85, fit: BoxFit.fill),
                ],
              )),
          Positioned(
            bottom: SizeConfig.heightMultiplier * 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextView(
                      text: 'Skilled Chefs',
                      color: Colors.black,
                      size: SizeConfig.textMultiplier *3.2,
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.poppins().toString(),

                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 0.5,
                    ),
                    TextView(
                      text: 'With Fantastic Tastes',
                      size: SizeConfig.textMultiplier * 2.8,
                      fontFamily: GoogleFonts.poppins().toString(),

                      color: const Color(0xffACADB9),
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemCount: _pages.length,
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return _pages[index];
            },
          ),
          SvgPicture.asset('assets/images/BoardingImages/wave.svg'),
          Positioned(
            left: 0,
            right: 0,
            bottom: SizeConfig.heightMultiplier * 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotsIndicator(
                  decorator: DotsDecorator(
                    activeColor: Color(0xff6C5FBC),
                    color: Color(0xffCDCAE7),
                    size: const Size(25, 10),
                    activeSize: const Size(50, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55),
                    ),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55),
                    ),
                  ),
                  dotsCount: _pages.length,
                  position: double.parse(selectedIndex.toString()),
                ),
              ],
            ),
          ),
          Positioned(
              top: SizeConfig.heightMultiplier * 5,
              right: SizeConfig.widthMultiplier * 1,
              child: selectedIndex == _pages.length -1 ? TextButton(
                  onPressed: () {
                    Get.off(const Login());

                  },
                  child:  const Text(
                    "Next",
                    style: TextStyle(
                        color: Color(0xffACADB9),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  )):TextButton(
                  onPressed: () {
                    setState(() {
                   selectedIndex +1;
                   _controller.jumpToPage(selectedIndex+1);

                    });
                  },
                  child:  const Text(
                    "Skip",
                    style: TextStyle(
                        color: Color(0xffACADB9),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ))),
        ],
      ),
    );
  }
}
