// ignore_for_file: prefer_const_constructors

import 'package:flings_flutter/Practice/HttpRequests/GETHttp.dart';
import 'package:flings_flutter/Practice/HttpRequests/POSTHttp.dart';
import 'package:flings_flutter/Practice/sharedPreference/sharedPreference.dart';
import 'package:flings_flutter/pages/Login/LoginWithNumber.dart';
import 'package:flings_flutter/pages/Login/otpFillingPage.dart';
import 'package:flings_flutter/pages/Information/UpdateMandatoryInfo.dart';
import 'package:flings_flutter/pages/Login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SharedPreferences.setMockInitialValues({
      "Name":""
    });
    return MaterialApp(
      initialRoute: '/sharedPreferencePage',
      routes: {
        '/': (context) => LoginPage(),
        '/loginWithNumberPage': (context) => const LoginWithNumberPage(),
        '/otpFillingPage': (context) => OTPFillingPage(
              phone: '',
            ),
        '/httpGETFile': (context) => HttpGETFile(),
        '/postHttpFile': (context) => POSTHttpRequest(),
        '/updateMandatoryInfo': (context) => UpdateMandatoryInfo(),
        '/sharedPreferencePage': (context) => SharedPreferencePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
