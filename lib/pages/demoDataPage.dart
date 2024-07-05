// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DemoDataPage extends StatefulWidget {
  const DemoDataPage({super.key});

  @override
  State<DemoDataPage> createState() => _DemoDataPageState();
}

class _DemoDataPageState extends State<DemoDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Data Page")),
    );
  }
}
