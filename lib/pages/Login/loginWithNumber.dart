// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LoginWithNumber extends StatelessWidget {
  const LoginWithNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
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
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(
                      CupertinoIcons.arrow_left_circle,
                      color: Colors.white,
                      size: 30,
                      // weight: ,
                    ),
                  ),

                  // SvgPicture.asset('assets/images/login/image-svg.svg')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
