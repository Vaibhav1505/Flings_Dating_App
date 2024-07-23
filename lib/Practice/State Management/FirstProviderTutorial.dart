// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flings_flutter/Practice/State%20Management/countProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstProviderTutorial extends StatefulWidget {
  const FirstProviderTutorial({super.key});

  @override
  State<FirstProviderTutorial> createState() => _FirstProviderTutorialState();
}

class _FirstProviderTutorialState extends State<FirstProviderTutorial> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    Timer.periodic(Duration(minutes: 1), (timer) {
      counter++;

      print(counter);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Tech Brother Tutorial");
    var importedCountNumber = Provider.of<CountProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Video 3"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Time"),
          Center(
            child: Text(
              "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          Text(
              "Counting Number:${importedCountNumber.storedCountingNumber.toString()}")
        ],
      ),
    );
  }
}
