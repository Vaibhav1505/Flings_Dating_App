// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flings_flutter/Cutsom%20Styling/buttons.dart';
import 'package:flings_flutter/Cutsom%20Styling/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:http/http.dart' as http;

class OTPFillingPage extends StatefulWidget {
  const OTPFillingPage({super.key});

  @override
  State<OTPFillingPage> createState() => _OTPFillingPageState();
}

class _OTPFillingPageState extends State<OTPFillingPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    var buttonStyling = new Buttons();
    var textStyling = new texts();

    matchOTP(String otp) async {
      print("otp function");
      if (otp.isNotEmpty) {
        var respones = await http.post(
            Uri.parse("http://192.168.1.24:5000/authenticate"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({"otp": otp}));

        var body = jsonEncode(respones.body);
        print(body);
      } else {
        print("Wrong OTP or Unable to Login");
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Verification Code",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              // SvgPicture.asset(
              //   'assets/images/otp.svg',
              //   semanticsLabel: 'login image',
              //   fit: BoxFit.contain,
              //   height: double.infinity,
              //   width: 250,
              //   alignment: Alignment.center,
              // ),
              Text(
                "We texted you 6 digit code ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                "Please Enter it below. ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),

              SizedBox(
                height: 40,
              ),
              OtpTextField(
                // controller: otpController,
                numberOfFields: 6,
                // borderColor: Colors.black,
                // showFieldAsBox: true,
                onSubmit: matchOTP,
              ),

              SizedBox(
                height: 50,
              ),
              Text(
                "This helps us to Verify User in our Market Place",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Didn't get the Code?",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 200,
                height: 45,
                // child: ElevatedButton(
                //   style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all(Colors.black)),
                //   child: Text(
                //     "Verify OTP",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   onPressed: () {},
                // ),
              )
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   backgroundColor: buttonStyle.floatingActionButtonColor,
        //   icon: Icon(
        //     Icons.done_all_outlined,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {
        //     print("OTP Button Pressed");
        //     matchOTP;
        //   },
        //   label: Text(
        //     "Submit",
        //     style: TextStyle(color: TextStyles.flotingActionButtonTextColor),
        //   ),
        // ),
      ),
    );
  }
}
