// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class POSTHttpRequest extends StatelessWidget {
  const POSTHttpRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST Request"),
        centerTitle: true,
      ),
      persistentFooterButtons: [
        Text("Namaste"),
        Text("Namaste"),
        Text("Namaste"),
        Text("Namaste"),
      ],
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
