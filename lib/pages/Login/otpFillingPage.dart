// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings, use_build_context_synchronously, must_be_immutable

//use custom input text field and also pass otpcontroller in body of http request

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flings_flutter/components/BackgroundContainer.dart';
import 'package:flings_flutter/pages/Profile/UpdateMandatoryInfo.dart';
import 'package:flings_flutter/routes/apiStrings.dart';
import 'package:flings_flutter/services/dioInterceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
    final dio = Dio();
    dio.interceptors.add(DioInterceptor());
    final storage = FlutterSecureStorage();

    Future<void> matchOTP() async {
      print("MatchOTP function Started");
      print("matchOTP function running");

      final String phone = widget.phone;
      final otp = otpController.text;

      if (phone.isNotEmpty && otp.isNotEmpty) {
        // var accessToken=
        var sendingData = {"phone": phone, "candidateCode": otp};
        var sendingBody = jsonEncode(sendingData);
        var response = await dio.post(
          (AUTHENTICATE),
          data: sendingBody,
        );

        if (response.statusCode == 200) {
          print("OTP verified Successfully");
          print("response=>$response");
          print(response.headers);
          var recievedbody = response.data;
          print("Recieved Data=>$recievedbody");
          var decodedData = {};
          try {
            // decodedData = JsonDecode(recievedbody);
            print("Decoded Recieved Data=>$decodedData");
          } catch (e) {
            print("Error while decoding=>$e");
          }

          String token =
              recievedbody['accessToken'].toString() ?? "No Access token ";
          String userData =
              recievedbody['userData'].toString() ?? "No User Data";

          print(recievedbody);
          await storage.write(key: 'token', value: token);
          print("Token:$token and UserData:$userData");

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UpdateMandatoryInfo(
                        token: token,
                        userData: userData,
                      )));
          var recievedToken = await storage.read(key: "token");
          print(recievedToken);
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
                        borderRadius: BorderRadius.circular(50),
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
