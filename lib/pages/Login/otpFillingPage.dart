// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings, use_build_context_synchronously, must_be_immutable

//use custom input text field and also pass otpcontroller in body of http request

import 'dart:convert';

import 'package:flings_flutter/components/BackgroundContainer.dart';
import 'package:flings_flutter/pages/Information/UpdateMandatoryInfo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OTPFillingPage extends StatefulWidget {
  String phone;

  OTPFillingPage({super.key, required this.phone});

  @override
  State<OTPFillingPage> createState() => _OTPFillingPageState();
}

class _OTPFillingPageState extends State<OTPFillingPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    // final phoneNumberFromLoginPage =
    //     ModalRoute.of(context)!.settings.arguments as String;

    Future<void> matchOTP() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      print("MatchOTP function Started");
      print("matchOTP function running");

      final String phone = widget.phone;
      final otp = otpController.text;

      if (phone.isNotEmpty && otp.isNotEmpty) {
        var data = {"phone": phone, "candidateCode": otp};
        var body = jsonEncode(data);
        var response = await http.post(
            Uri.parse('http://192.168.135.144:5000/authenticate'),
            body: body,
            headers: {"Content-Type": "application/json"});

        if (response.statusCode == 200) {
          print("OTP verified Successfully");
          prefs.setString("Data", body);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UpdateMandatoryInfo()));
          print("MatchOTP function Completed");
        } else {
          print("Unable to verify OTP");
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        body: BackGroundContainer(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: TextFormField(
                  controller: otpController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter OTP",
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 229, 229, 229),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hoverColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 25,
              // ),

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
                height: 50,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: Text(
                  "Verify OTP",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  matchOTP();
                },
              ),
              // SizedBox(
              //   width: 200,
              //   height: 45,
              //   child: ElevatedButton(
              //     style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all(Colors.black)),
              //     child: Text(
              //       "Verify OTP",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     onPressed: () {},
              //   ),
              // )
            ],
          ),
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
    );
  }
}
