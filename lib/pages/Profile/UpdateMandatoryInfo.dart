// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flings_flutter/routes/apiStrings.dart';
import 'package:flings_flutter/services/InterceptedHTTP.dart';
import 'package:flings_flutter/services/dioInterceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:flings_flutter/components/BackgroundContainer.dart';
import 'package:flings_flutter/components/DropDown.dart';
import 'package:flings_flutter/components/TextInputField.dart';
import 'package:flings_flutter/components/onPressedButton.dart';
import 'package:flings_flutter/pages/Profile/UpdataProfile.dart';

class UpdateMandatoryInfo extends StatefulWidget {
  var token;
  var userData;
  UpdateMandatoryInfo({super.key, required this.token, required this.userData});

  @override
  State<UpdateMandatoryInfo> createState() => _UpdateMandatoryInfoState();
}

class _UpdateMandatoryInfoState extends State<UpdateMandatoryInfo> {
  String? selectedGender;
  String? selectedOrientation;
  String? formattedDate;

  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  final storage = FlutterSecureStorage();
  var InterceptedHTTPrequest = InterceptedHTTP();
  List<String> userGender = ['Male', 'Female', 'Prefer not to say'];
  List<String> oreintationGender = ['Male', 'Female', 'Prefer not to say'];
  final dio = Dio();
  // ignore: non_constant_identifier_names
  DioAPI() {
    dio.interceptors.add(DioInterceptor());
  }

  Future<void> updateMendatoryInfoFunction() async {
    if (nameController.text.isNotEmpty && dobController.text.isNotEmpty) {
      var data = {
        "name": nameController.text,
        "dob": dobController.text,
        "gender": selectedGender,
        "orientation": selectedOrientation
      };

      // var recivedToken = await storage.read(key: 'token') ?? "No Token Saved";
      // print(recivedToken);
      var recievedResponse =
          await InterceptedHTTPrequest.postHttp(UPDATE_MANDATORY_FIELD, data);
      print(recievedResponse);

      if (recievedResponse.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UpdateProfile()));
      } else {
        print('Unbale to transfer to next page');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundContainer(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get Started With Flings",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Let's setup your Profile",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                CustomInputField(
                  borderColor: Colors.white,
                  hintTextColor: Colors.white,
                  controller: nameController,
                  backgroundColor: Colors.transparent,
                  hintText: "Enter Your Name",
                  borderRadius: 50,
                  labelText: "Name",
                  onTap: () {
                    print(nameController.text);
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CustomInputField(
                  controller: dobController,
                  backgroundColor: Colors.transparent,
                  icon: Icon(
                    CupertinoIcons.calendar,
                    color: Colors.white,
                  ),
                  hintText: "Select your Date of Birth",
                  hintTextColor: Colors.white,
                  borderRadius: 50,
                  labelText: "Date of Birth",
                  labelTextColor: Colors.white,
                  borderColor: Colors.white,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      formattedDate =
                          DateFormat("dd/MM/yyyy").format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dobController.text =
                            formattedDate!; //set output date to TextField value.
                      });
                    } else {}
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CustomDropDown(
                  dropDownOptions: userGender,
                  hintText: "What's your Gender?",
                  dropDownValue: userGender.contains(selectedGender)
                      ? selectedGender
                      : null,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGender = newValue;

                      print(selectedGender);
                    });
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CustomDropDown(
                  dropDownValue: oreintationGender.contains(selectedOrientation)
                      ? selectedOrientation
                      : null,
                  dropDownOptions: oreintationGender,
                  hintText: "Whom do you want to meet?",
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOrientation = newValue;

                      print(selectedOrientation);
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OnPressedButton(
                        buttonIcon: Icon(
                          CupertinoIcons.arrow_right_circle,
                          color: Colors.white,
                        ),
                        buttonColor: Colors.black,
                        buttonPadding: 20,
                        buttonBorderRadius: 50,
                        buttonText: "Next",
                        buttonTextColor: Colors.white,
                        onpressed: () {
                          updateMendatoryInfoFunction();
                          print("updateMendatoryInfo Page Button Tapped");
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
