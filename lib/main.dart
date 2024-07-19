// ignore_for_file: prefer_const_constructors

import 'package:flings_flutter/Practice/HttpRequests/DioIntreceptorTesting.dart';
import 'package:flings_flutter/Practice/HttpRequests/GETHttp.dart';
import 'package:flings_flutter/Practice/HttpRequests/POSTHttp.dart';
import 'package:flings_flutter/Practice/Storage/secureStorage.dart';
import 'package:flings_flutter/Practice/Storage/sharedPreference.dart';
import 'package:flings_flutter/components/BottomNavigationBar.dart';
import 'package:flings_flutter/pages/Login/LoginWithNumber.dart';
import 'package:flings_flutter/pages/Login/otpFillingPage.dart';
import 'package:flings_flutter/pages/Login/LoginPage.dart';
import 'package:flings_flutter/pages/Main/PeopleList/PeopleList.dart';
import 'package:flings_flutter/pages/Profile/UpdataProfile.dart';
import 'package:flings_flutter/pages/Profile/UpdateMandatoryInfo.dart';
import 'package:flings_flutter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root ośf your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(textTheme: GoogleFonts.getTextTheme('poppins')),
      initialRoute: '/bottomNavigationBar',
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.loginPage: (context) => LoginPage(),
        MyRoutes.loginWithNumberPage: (context) => const LoginWithNumberPage(),
        MyRoutes.otpFillingPage: (context) => OTPFillingPage(phone: ''),
        MyRoutes.updateMandatoryInfo: (context) =>
            UpdateMandatoryInfo(token: '', userData: ''),
        MyRoutes.updateProfile: (context) => UpdateProfile(),
        MyRoutes.bottomNavigationBar: (context) => BottomNavigation(),
        MyRoutes.peopleList: (context) => PeopleList(),

        //PRACTICE ROUTE

        // '/httpGETFile': (context) => HttpGETFile(),
        '/postHttpFile': (context) => POSTHttpRequest(),
        '/sharedPreferencePage': (context) => SharedPreferencePage(),
        '/secureStorage': (context) => DemoSecureStoragePage(),
        '/Interceptors': (context) => DemoInterceptor()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
