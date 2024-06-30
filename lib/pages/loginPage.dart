// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flings_flutter/components/loginButtons.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
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
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/icon.ico'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Flings",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CustomLoginButtons(
                  icon: Icon(
                    Icons.facebook_outlined,
                    color: Colors.white,
                  ),
                  onpressed: () => print("hell"),
                  cardTitle: "Signin with Facebook",
                ),
                SizedBox(
                  height: 15,
                ),
                CustomLoginButtons(
                    onpressed: () => print("asjdndkn"),
                    icon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    cardTitle: "Signin with Email"),
                SizedBox(
                  height: 20,
                ),
                CustomLoginButtons(
                    onpressed: () {
                      Navigator.pushNamed(context, '/loginWithNumber');
                    },
                    icon: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    cardTitle: "Signin With Number"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "New User? Create an Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                      // decoration: TextDecoration.underline,
                      ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
