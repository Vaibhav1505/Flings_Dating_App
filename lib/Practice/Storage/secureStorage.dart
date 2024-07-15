// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DemoSecureStoragePage extends StatefulWidget {
  const DemoSecureStoragePage({super.key});

  @override
  State<DemoSecureStoragePage> createState() => _DemoSecureStoragePageState();
}

class _DemoSecureStoragePageState extends State<DemoSecureStoragePage> {
  TextEditingController nameController = TextEditingController();
  String gettingName = '';
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  Future savingName() async {
    await storage.write(key: "Name", value: nameController.text);
    print("Name Stored successfully");
    print(storage.hashCode.toString());
  }

  Future getName() async {
    gettingName = await storage.read(key: "Name") ?? "No value Stored";
    print("Name get successfully");
    print(storage.hashCode.toString());
    print("Stored Name is ${gettingName.toString()}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(gettingName),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Please Enter your Name", labelText: " Name"),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  print("${nameController.text} Entered");
                  savingName();
                },
                child: Text("Save Name"))
          ],
        ),
      ),
    );
  }
}
