// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// CHECK LINE 95

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class LoginWithNumberPage extends StatelessWidget {
  const LoginWithNumberPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumber = TextEditingController();

    submittingNumber() async {
      if (phoneNumber.text.isNotEmpty) {
        var response = await http.post(
            Uri.parse("http://192.168.1.24:5000/generateCode"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({"phone": phoneNumber.text}));

        var body = jsonEncode(response.body);

        print("OTP: $body");
      }
    }

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
                ],
              ),
              SvgPicture.asset(
                'assets/images/login-image-svg.svg',
                semanticsLabel: 'login image',
                fit: BoxFit.contain,
                height: 250,
                width: double.infinity,
                alignment: Alignment.center,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text(
                  "Get Started With Flings",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 40),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: TextFormField(


//DO NOT FORGET TO ADD VALIDATION IN LAST SO...NO PERSON CAN MOVE TO NEXT PAGE BEFORE FILLING THE PHONE NUMBER


                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: Icon(
                        CupertinoIcons.phone,
                        color: Colors.black,
                      ),
                      iconColor: Colors.white,
                      hintText: "Enter 10 digit Mobile Number",
                      label: Text(
                        "Mobile Number",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )),
                  controller: phoneNumber,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, "/otpFillingPage");
            submittingNumber();
          },
          icon: Icon(
            CupertinoIcons.person_fill,
            color: Colors.white,
          ),
          label: Text(
            "Generate OTP",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
