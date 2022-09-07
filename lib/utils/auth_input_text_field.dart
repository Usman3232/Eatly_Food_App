import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthTextInputField extends StatefulWidget {
  final Color textColor;
  final String? labelText;
  final String hintText;
  final double? hintSize;
  final Color hintcolor;
  final Color bordercolor;
  final double radius;
  final bool isPassword;
  final Color fillColor;
  final Color cursorColor;
  final TextEditingController? textEditingController;
  final TextInputType inputType;
  final suffixIcon;
  final prefixIcon;
  final enabled;
  final Function(String)? onChnage;
  final String? Function(String? val)?  validator;
  final List<TextInputFormatter>? inputformatter;
  final int? maxlength;
  final EdgeInsetsGeometry? contentpadding;

  const AuthTextInputField({
    Key? key,
    required this.hintText,
    this.textEditingController,
    this.isPassword = false,
    this.hintSize,
    this.hintcolor = Colors.grey,
    this.fillColor = Colors.transparent,
    this.textColor = Colors.black,
    this.cursorColor = Colors.black,
    this.inputType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled,
    this.labelText,
    this.radius = 10,
    this.bordercolor = Colors.black, this.onChnage, this.inputformatter, this.maxlength, this.contentpadding, this.validator,
  }) : super(key: key);

  @override
  State<AuthTextInputField> createState() => _TextInputFieldViewState();
}

class _TextInputFieldViewState extends State<AuthTextInputField> {
  bool isObscure = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isObscure = widget.isPassword == true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      maxLength: widget.maxlength,
      inputFormatters: widget.inputformatter,
      enabled: widget.enabled,
      obscureText: isObscure,
      onChanged: widget.onChnage,
      style: TextStyle(color: widget.textColor),
      controller: widget.textEditingController,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        contentPadding:widget.contentpadding ,
        filled: true,
        fillColor: widget.fillColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(width: 2,color: widget.bordercolor)),
        hintText: widget.hintText,
        hintStyle:
            TextStyle(fontSize: widget.hintSize, color: widget.hintcolor),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: isObscure
                    ? Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.hide_source,
                        color: Colors.black,
                      )
                // Container(
                //   height: 16,
                //   width: 16,
                //   margin: EdgeInsets.all(15),
                //   child: Image.asset(
                //       isObscure ? "assets/eye_hide.png" : "assets/lock.png"),
                // ),
                )
            : widget.suffixIcon,
      ),
      cursorColor: widget.cursorColor,
    );
  }
}
