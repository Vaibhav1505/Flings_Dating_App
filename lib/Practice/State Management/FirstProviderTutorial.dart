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
    print("InitState called");
    // TODO: implement initState
    var providerDemo = Provider.of<ProviderTutorial>(context, listen: false);
    Timer.periodic(Duration(hours: 1), (timer) {
      providerDemo.increaseCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Tech Brother Tutorial, Full Widget build");
    var providerDemo = Provider.of<ProviderTutorial>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Video 3"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            tileColor: Colors.teal[100],
            leading: Consumer<ProviderTutorial>(
              builder: (context, value, child) {
                return Text(value.userName);
              },
            ),
            trailing: Consumer<ProviderTutorial>(
              builder: (context, value, child) {
                return Text(value.storedCountingNumber.toString());
              },
            ),
          ),
          Text("Time"),
          Center(
            child: Text(
              "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          Consumer<ProviderTutorial>(
            builder: (context, value, child) {
              return Text(
                "Counting Number:${value.storedCountingNumber.toString()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          providerDemo.increaseCount();
        },
      ),
    );
  }
}
