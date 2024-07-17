// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:convert';

import 'package:flings_flutter/Practice/HttpRequests/POSTHttp.dart';
import 'package:flings_flutter/Themes/themes.dart';
import 'package:flings_flutter/components/BottomNavigationBar.dart';
import 'package:flings_flutter/components/onPressedButton.dart';
import 'package:flings_flutter/pages/Main/PeopleList.dart';
import 'package:flings_flutter/pages/Profile/BasicInformationSection.dart';
import 'package:flings_flutter/pages/Profile/GetProfileStatus.dart';
import 'package:flings_flutter/pages/Profile/YourHabitsSection.dart';
import 'package:flings_flutter/routes/apiStrings.dart';
import 'package:flings_flutter/services/InterceptedHTTP.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var interceptedHttpRequest = InterceptedHTTP();

  String? selectedEducation;
  String? selectedReligion;
  String? selectedDrinks;
  String? selectedSmoke;
  String? selectedExcercisingHabit;
  String? selectedDiet;
  String? selectedSocialMedia;

  Future<void> sendUpdateData() async {
    var data = {
      // "about": aboutController.text,
      // "job": jobTittleController.text,
      // "company": companyController.text,
      "selectedEducation": selectedEducation,
      "selectedReligion": selectedReligion,
      "selectedDrinks": selectedDrinks,
      "selectedSmoke": selectedSmoke,
      "selectedExcercisingHabit": selectedExcercisingHabit,
      "selectedDiet": selectedDiet,
      "selectedSocialMedia": selectedSocialMedia
    };

    var recievedResponse =
        await interceptedHttpRequest.postHttp(UPDATE_PROFILE, data);
    print(recievedResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          actions: [
            OnPressedButton(
                buttonPadding: 10,
                buttonTextColor: Colors.black,
                buttonText: "Done",
                onpressed: () {
                  sendUpdateData();
                  print("Changes Done");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigation()));
                },
                buttonColor: Colors.white,
                buttonBorderRadius: 50,
                buttonIcon: Icon(
                  CupertinoIcons.check_mark_circled,
                  color: Colors.black,
                )),
            SizedBox(
              width: 20,
            ),
          ],
          title: Text(
            "Edit Profile",
            style: TextStyle(
                color: MyTheme.appBarMainHeading, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),

              //{BASIC INFORMAITON SECTION}

              BasicInfoSection(
                selectedEducation: selectedEducation,
                selectedReligion: selectedReligion,
              ),

              SizedBox(
                height: 25,
              ),
              //{YOUR HABITS SECTION}

              YourHabitsSection(
                  selectedDrinks: selectedDrinks,
                  selectedSmoke: selectedSmoke,
                  selectedExcercisingHabit: selectedExcercisingHabit,
                  selectedDiet: selectedDiet,
                  selectedSocialMedia: selectedSocialMedia)
            ],
          ),
        ),
      ),
    );
  }
}
