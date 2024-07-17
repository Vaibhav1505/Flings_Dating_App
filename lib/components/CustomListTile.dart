import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.backgroundColor,
    this.leadingWidget,
    required this.leadingText,
    this.trailingWidget,
    this.titleColor,
    this.borderRadius = 10.0,
    this.onTap,
    this.shape,
  });

  final Color? backgroundColor;
  final Widget? leadingWidget;
  final String leadingText;
  final Widget? trailingWidget;
  final Color? titleColor;
  final double borderRadius;
  final VoidCallback? onTap;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
      child: ListTile(
        
        onTap: () {},
        leading: leadingWidget,
        title: Text(
          leadingText,
          style: TextStyle(color: titleColor),
        ),
        trailing: trailingWidget,
      ),
    );
  }
}
