import 'package:flings_flutter/components/BottomNavigationBar.dart';
import 'package:flings_flutter/components/LoadingIcon.dart';

import 'package:flings_flutter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isLoaded = false;

  void getToken(context) async {
    var storage = FlutterSecureStorage();
    var token;
    token = await storage.read(key: "token");
    print("Tokenn=>$token");

    if (token != null) {
      print(
          "Token Recived....Naivgating you to the Next page...(Landing page code)");
      return Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          isLoaded = true;
        });
      });
    }
    if (token == null) {
      print("Token Not Recieved");
      Navigator.pushNamed(context, MyRoutes.loginPage);
    }
  }

  @override
  void initState() {
    print("intiState Called");
    // TODO: implement initState
    super.initState();
    getToken(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoaded
          ? BottomNavigation()
          : Center(
              child: CircularProgressIndicator(
              color: Colors.yellow[400],
            )),
    );
  }
}
