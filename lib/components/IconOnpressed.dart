import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconOnpressed extends StatelessWidget {
  Icon icon;
  VoidCallback onpressed;
  BoxShape? shape;
  Color? buttonColor;
  double? radius;
  IconOnpressed(
      {super.key,
      required this.icon,
      required this.onpressed,
      this.buttonColor,
      this.radius,
      this.shape});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.circle,
          color: buttonColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(radius ?? 15),
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
