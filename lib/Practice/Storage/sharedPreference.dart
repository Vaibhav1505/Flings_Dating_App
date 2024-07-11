// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencePage extends StatefulWidget {
  const SharedPreferencePage({super.key});

  @override
  State<SharedPreferencePage> createState() => _SharedPreferencePageState();
}

class _SharedPreferencePageState extends State<SharedPreferencePage> {
  String _nameValue = '';
  // SharedPreferences? prefs = null;

  @override
  void initState() {
    super.initState();
    print("initState function called");
    updateName();
  }

  Future<void> updateName() async {
    final prefs = await SharedPreferences.getInstance();
    print("Saving name function=> " + prefs.hashCode.toString());
    _nameValue = await prefs.getString("Name") ?? "nothing savd";
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
            Text(_nameValue),
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
                final prefs = await SharedPreferences.getInstance();
                print("onpressed function=> " + prefs.hashCode.toString());
                await prefs.setString("Name", nameController.text);
                print("Set String worked");
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
