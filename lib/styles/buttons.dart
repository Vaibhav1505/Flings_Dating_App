import 'package:flutter/material.dart';

class Buttons {
  Color floatingActionButtonColor = Colors.black;
}

ButtonStyle blackTextButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.black),
    padding: MaterialStatePropertyAll(EdgeInsets.all(10)));

    ButtonStyle whiteTextButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    padding: MaterialStatePropertyAll(EdgeInsets.all(10)));
