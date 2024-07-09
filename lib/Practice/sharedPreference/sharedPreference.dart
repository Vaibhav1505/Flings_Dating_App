// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencePage extends StatefulWidget {
  const SharedPreferencePage({super.key});

  @override
  State<SharedPreferencePage> createState() => _SharedPreferencePageState();
}

class _SharedPreferencePageState extends State<SharedPreferencePage> {
  String? _nameValue = '';

  @override
  void initState() {
    super.initState();
    savingName();
  }

 void savingName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _nameValue = prefs.getString("Name") ?? "lund";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference Practice"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(_nameValue.toString()),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter your Name",
                labelText: "Name",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString("Name", nameController.text);
                savingName();
              },
              child: Text(
                "Enter Name",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
