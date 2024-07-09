// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

// CHECK LINE 95

import 'dart:convert';

import 'package:flings_flutter/components/BackgroundContainer.dart';
import 'package:flings_flutter/pages/Login/otpFillingPage.dart';
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

    Future<void> submittingNumber(String phoneNumber) async {
      print("Submitting function started");
      final data = {'phone': phoneNumber};
      print(data);
      if (phoneNumber.isNotEmpty) {
        var response = await http.post(
            Uri.parse("http://192.168.135.144:5000/generateCode"),
          
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(data));

        if (response.statusCode == 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OTPFillingPage(phone: phoneNumber)));
        }
        print(
            "SUbmitting Phone number function completed Successfullt and OTP generated");

        var body = jsonEncode(response.body);
      }
    }

    return SafeArea(
      child: Scaffold(
        body: BackGroundContainer(
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
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: Text(
                    "Generate OTP",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    submittingNumber(phoneNumber.text);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
    // floatingActionButton: FloatingActionButton.extended(
    //   backgroundColor: Colors.black,
    //   onPressed: () {},
    //   icon: Icon(
    //     CupertinoIcons.person_fill,
    //     color: Colors.white,
    //   ),
    //   label: Text(
    //     "Generate OTP",
    //     style: TextStyle(color: Colors.white),
    //   ),
    // ),
  }
}
