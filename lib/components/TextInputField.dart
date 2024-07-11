import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  TextEditingController? controller;
  String hintText;
  Icon? icon;
  String? labelText;
  Color? backgroundColor;
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
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          filled: true,
          fillColor: backgroundColor,
          hintText: hintText,
          prefixIcon: icon,
          labelText: labelText),
      onTap: onTap,
    );
  }
}
