// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomLoginButtons extends StatelessWidget {
  final Icon icon;
  final String cardTitle;
  final VoidCallback onpressed;

  CustomLoginButtons(
      {required this.icon, required this.cardTitle, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onpressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: 15,
            ),
            Text(
              cardTitle,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        style: ButtonStyle(
            padding:
                MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent)),
      ),
    );
  }
}
