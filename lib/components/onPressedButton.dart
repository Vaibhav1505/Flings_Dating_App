import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnPressedButton extends StatelessWidget {
  String buttonText;
  VoidCallback onpressed;
  Color? buttonColor;
  Color? buttonTextColor;
  double buttonBorderRadius;
  OnPressedButton(
      {super.key,
      required this.buttonText,
      required this.onpressed,
      this.buttonColor,
      this.buttonTextColor,
      required this.buttonBorderRadius});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onpressed,
      child: Text(
        buttonText,
        style: TextStyle(color: buttonTextColor),
      ),
      style: ElevatedButton.styleFrom(
        
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonBorderRadius))),
    );
  }
}
