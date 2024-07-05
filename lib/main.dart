// ignore_for_file: prefer_const_constructors

import 'package:flings_flutter/HttpRequests/GETHttp.dart';
import 'package:flings_flutter/HttpRequests/POSTHttp.dart';
import 'package:flings_flutter/pages/Login/loginWithNumber.dart';
import 'package:flings_flutter/pages/Login/otpFillingPage.dart';
import 'package:flings_flutter/pages/loginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/loginWithNumberPage',
      routes: {
        '/': (context) => LoginPage(),
        '/loginWithNumberPage': (context) => const LoginWithNumberPage(),
        '/otpFillingPage': (context) => OTPFillingPage(
              phone: '',
            ),
        '/httpGETFile': (context) => HttpGETFile(),
        '/postHttpFile': (context) => POSTHttpRequest()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
