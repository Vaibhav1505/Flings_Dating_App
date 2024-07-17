import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OptionContainer extends StatelessWidget {
  String title;
  Color? backgroundColor, leadingColor;
  double borderRadius;
  VoidCallback? onTap;

  OptionContainer(
      {super.key,
      this.backgroundColor,
      required this.title,
      required this.borderRadius,
      this.leadingColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)),
      width: 50,
      child: ListTile(
        onTap: onTap,
        leading: Text(
          title,
          style: TextStyle(
              color: leadingColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
