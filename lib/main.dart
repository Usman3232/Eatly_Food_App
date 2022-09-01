import 'package:eatly_foodapp/utils/size_config.dart';
import 'package:eatly_foodapp/views/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

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
              theme: ThemeData(
                scaffoldBackgroundColor: Color(0xffF3F5F6),
              ),
              debugShowCheckedModeBanner: false,
              home: Splash(),
            );
          },
        );
      },
    );
  }
}
