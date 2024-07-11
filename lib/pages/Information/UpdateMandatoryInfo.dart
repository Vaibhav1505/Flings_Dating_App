// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flings_flutter/Practice/Custom/DemoDropDown.dart';
import 'package:flings_flutter/components/BackgroundContainer.dart';
import 'package:flings_flutter/components/DropDown.dart';
import 'package:flings_flutter/components/TextInputField.dart';
import 'package:flings_flutter/components/onPressedButton.dart';

class UpdateMandatoryInfo extends StatefulWidget {
  const UpdateMandatoryInfo({super.key});

  @override
  State<UpdateMandatoryInfo> createState() => _UpdateMandatoryInfoState();
}

class _UpdateMandatoryInfoState extends State<UpdateMandatoryInfo> {
  String? selectedGender;
  String? selectedOrientation;
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  List<String> userGender = ['Male', 'Female', 'Prefer not to say'];
  List<String> oreintationGender = ['Male', 'Female', 'Prefer not to say'];

  Future<void> updateMendatoryInfoFunction() async {
    var data = {
      
      "name": nameController.text,
      "dob": dobController.text,
      "gender": selectedGender,
      "orientation": selectedOrientation
    };

    var response = await http.post(
        Uri.parse(
          'http://192.168.135.144:5000/updateMendatoryInfo',
        ),
        headers: {"Content-Type": "application/json"},
        body: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundContainer(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
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
              height: 25,
            ),
            CustomInputField(
              controller: nameController,
              backgroundColor: Colors.white,
              hintText: "Enter Your Name",
              borderRadius: 15,
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
              backgroundColor: Colors.white,
              icon: Icon(CupertinoIcons.calendar),
              hintText: "Select your Date of Birth",
              borderRadius: 15,
              labelText: "Date of Birth",
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
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dobController.text =
                        formattedDate; //set output date to TextField value.
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
              dropDownValue:
                  userGender.contains(selectedGender) ? selectedGender : null,
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
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OnPressedButton(
                    buttonColor: Colors.black,
                    buttonBorderRadius: 10,
                    buttonText: "Next",
                    buttonTextColor: Colors.white,
                    onpressed: () {
                      updateMendatoryInfoFunction;
                      print("updateMendatoryInfo Page Button Tapped");
                    }),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
