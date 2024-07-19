import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String TagTitle;
  Color TagColor;
  Tag({super.key, required this.TagTitle, required this.TagColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.white, width: 3),
          )),
      child: Center(
        child: Text(
          TagTitle,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
