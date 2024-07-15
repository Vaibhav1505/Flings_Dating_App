import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnPressedButton extends StatelessWidget {
  String buttonText;
  VoidCallback onpressed;
  Color? buttonColor;
  Color? buttonTextColor;
  double buttonBorderRadius;
  double? buttonPadding;
  Icon buttonIcon;
  OnPressedButton(
      {super.key,
      required this.buttonText,
      required this.onpressed,
      this.buttonColor,
      this.buttonTextColor,
      this.buttonPadding,
      required this.buttonBorderRadius,
      required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onpressed,
      label: Text(
        buttonText,
        style: TextStyle(color: buttonTextColor),
      ),
      icon: buttonIcon,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(buttonPadding ?? 10),
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonBorderRadius))),
    );
  }
}
