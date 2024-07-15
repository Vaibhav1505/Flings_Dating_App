import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  TextEditingController? controller;
  String hintText;
  Icon? icon;
  String? labelText;
  Color? backgroundColor, hintTextColor, labelTextColor;
  Color borderColor;
  double borderRadius;

  VoidCallback? onTap;

  CustomInputField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.borderRadius,
      this.icon,
      required this.labelText,
      this.backgroundColor,
      this.hintTextColor,
      this.labelTextColor,
      required this.borderColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(borderRadius)),
          filled: true,
          focusColor: borderColor,
          fillColor: backgroundColor,
          hintText: hintText,
          hintStyle: TextStyle(color: hintTextColor),
          prefixIcon: icon,
          labelText: labelText,
          labelStyle: TextStyle(color: hintTextColor)),
      onTap: onTap,
    );
  }
}
