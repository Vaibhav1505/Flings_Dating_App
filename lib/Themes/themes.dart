// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  // static ThemeData darkTheme(BuildContext context) => ThemeData();

  // static ThemeData lightTheme(BuildContext context) => ThemeData();

  static Color appBarMainHeading = Colors.white;
  static Color whiteColor = Colors.white;
  static Color fadedGrey = const Color.fromARGB(81, 158, 158, 158);
  static Shader linearGradientColor = LinearGradient(
    colors: <Color>[
      Color(0xff1f005c),
      Color(0xff5b0060),
      Color(0xff870160),
      Color(0xffac255e),
      Color(0xffca485c),
      Color(0xffe16b5c),
      Color(0xfff39060),
      Color(0xffffb56b),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
