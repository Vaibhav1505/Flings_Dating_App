import 'package:flutter/material.dart';

class MainProfile extends StatelessWidget {
  const MainProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.person),
              label: Text("Profile"))),
    );
  }
}
