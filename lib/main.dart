// ignore_for_file: prefer_const_constructors

import 'package:flings_flutter/Practice/State%20Management/FirstProviderTutorial.dart';
import 'package:flings_flutter/Practice/State%20Management/countProvider.dart';
import 'package:flings_flutter/components/BottomNavigationBar.dart';
import 'package:flings_flutter/pages/Login/LoginPage.dart';
import 'package:flings_flutter/pages/Login/LoginWithNumber.dart';
import 'package:flings_flutter/pages/Login/OTPFillingPage.dart';
import 'package:flings_flutter/pages/Main/LandingPage.dart';
import 'package:flings_flutter/pages/Main/PeopleList/PeopleList.dart';
import 'package:flings_flutter/pages/Profile/UpdataProfile.dart';
import 'package:flings_flutter/pages/Profile/UpdateMandatoryInfo.dart';
import 'package:flings_flutter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root ośf your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        initialRoute: '/',
        routes: {
          '/': (context) => FirstProviderTutorial(),
// '/': (context) => LandingPage(),
          MyRoutes.loginPage: (context) => LoginPage(),
          MyRoutes.loginWithNumberPage: (context) => LoginWithNumberPage(),
          MyRoutes.otpFillingPage: (context) => OTPFillingPage(phone: ''),
          MyRoutes.updateMandatoryInfo: (context) =>
              UpdateMandatoryInfo(token: '', userData: ''),
          MyRoutes.updateProfile: (context) => UpdateProfile(),
          MyRoutes.bottomNavigationBar: (context) => BottomNavigation(),
          MyRoutes.peopleList: (context) => PeopleList(),

          //PRACTICE

          MyRoutes.providerStateManagementTutorial: (context) =>
              FirstProviderTutorial()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
