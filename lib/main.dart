import 'package:device_preview/device_preview.dart';
import 'package:eatly_foodapp/utils/size_config.dart';
import 'package:eatly_foodapp/views/bottom_navigation/bottom_navigation_tab.dart';
import 'package:eatly_foodapp/views/splash/splash.dart';
import 'package:eatly_foodapp/views/verification/emailScreen/emailScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
    MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GetMaterialApp(
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              theme: ThemeData(
                scaffoldBackgroundColor: Color(0xffF3F5F6),
                fontFamily: GoogleFonts.poppins().toString(),
              ),
              debugShowCheckedModeBanner: false,
              home: Splash(),
              // home: EmailScreen(),
              // home: BottomBar(),
            );
          },
        );
      },
    );
  }
}
