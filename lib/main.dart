// ignore_for_file: prefer_const_constructors

import 'package:flings_flutter/Practice/HttpRequests/GETHttp.dart';
import 'package:flings_flutter/Practice/HttpRequests/POSTHttp.dart';
import 'package:flings_flutter/Practice/Storage/sharedPreference.dart';
import 'package:flings_flutter/pages/Login/LoginWithNumber.dart';
import 'package:flings_flutter/pages/Login/otpFillingPage.dart';
import 'package:flings_flutter/pages/Information/UpdateMandatoryInfo.dart';
import 'package:flings_flutter/pages/Login/LoginPage.dart';
import 'package:flings_flutter/routes/routes.dart';
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
    SharedPreferences.setMockInitialValues({});
    return MaterialApp(
      initialRoute: '/updateMendatoryField',
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.loginPage: (context) => LoginPage(),
        MyRoutes.loginWithNumberPage: (context) => const LoginWithNumberPage(),
        MyRoutes.otpFillingPage: (context) => OTPFillingPage(
              phone: '',
            ),
        MyRoutes.updateMandatoryInfo: (context) => UpdateMandatoryInfo(),

        //PRACTICE ROUTE

        '/httpGETFile': (context) => HttpGETFile(),
        '/postHttpFile': (context) => POSTHttpRequest(),
        '/sharedPreferencePage': (context) => SharedPreferencePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
