// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UpdateMandatoryInfo extends StatelessWidget {
  const UpdateMandatoryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mendatory"),
      ),
      body: Column(
        children: [Text("Name")],
      ),
    );
  }
}
