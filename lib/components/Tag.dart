import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Icon TagIcon;
  Color TagColor;

  Tag({
    super.key,
    required this.TagIcon,
    required this.TagColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            side: BorderSide(color: Colors.white, width: 3),
          )),
      child: Center(
        child: TagIcon,
      ),
    );
  }
}
