// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirstTakingInputPage extends StatefulWidget {
  const FirstTakingInputPage({super.key});

  @override
  State<FirstTakingInputPage> createState() => _FirstTakingInputPageState();
}

class _FirstTakingInputPageState extends State<FirstTakingInputPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void userSignUp() async {
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      var dataBody = {
        "name": name.text,
        "email": email.text,
        "password": password.text
      };

      var response =
          await http.post(Uri.parse("http://192.168.1.24:3000/user/signup"));

      var body = jsonEncode(dataBody);

      print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: name,
            decoration: InputDecoration(label: Text("Enter Name")),
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(label: Text("Enter Email")),
          ),
          TextFormField(
            controller: password,
            decoration: InputDecoration(label: Text("Enter Password")),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              userSignUp();
            },
            child: Text("Submit", style: TextStyle(color: Colors.white)),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
          )
        ],
      ),
    ));
  }
}
