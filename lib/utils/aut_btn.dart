import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  String title;
  final double? height;
  final double? width;
  final Color? colour, textcolour;
  final double? fontSize;
  final double? radius;

  // Function callback;
  VoidCallback callback;

  CustomAuthButton(
      {Key? key,
      this.title = "",
      required this.callback,
      this.colour,
      this.textcolour = Colors.white,
      this.height,
      this.width,
      this.fontSize,  this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
minWidth: width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!)
      ),
      color: colour,
      onPressed: () {
        callback();
      },
      child: Text(
        title,
        style: TextStyle(fontSize: fontSize, color: textcolour),
      ),
    );
  }
}
