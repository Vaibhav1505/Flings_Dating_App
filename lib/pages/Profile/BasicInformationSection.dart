// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flings_flutter/Themes/themes.dart';
import 'package:flings_flutter/components/CustomDiallogBox.dart';
import 'package:flings_flutter/components/CustomListTile.dart';
import 'package:flings_flutter/components/TextInputField.dart';
import 'package:flings_flutter/components/onPressedButton.dart';
import 'package:flings_flutter/data/options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicInfoSection extends StatefulWidget {
  String? selectedEducation, selectedReligion, about, jobTitle, company;

  BasicInfoSection(
      {super.key,
      this.selectedEducation,
      this.selectedReligion,
      this.about,
      this.company,
      this.jobTitle});

  @override
  State<BasicInfoSection> createState() => _BasicInfoSectionState();
}

class _BasicInfoSectionState extends State<BasicInfoSection> {
  String? selectedEducation, selectedReligion, about, jobTitle, company;
  TextEditingController aboutController = TextEditingController();
  TextEditingController jobTitileController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      // direction: Axis.vertical,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              "Basic Info",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = MyTheme.linearGradientColor),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text("About"),
          ],
        ),
        CustomInputField(
            hintText: "tell us about yourself",
            borderRadius: 50,
            controller: aboutController,
            labelText: "About",
            borderColor: Colors.transparent),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [Text("Job Title")],
        ),
        CustomInputField(
            hintText: "tell us about Job",
            controller: jobTitileController,
            borderRadius: 50,
            labelText: "JOb Title",
            borderColor: Colors.transparent),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text("Company"),
          ],
        ),
        CustomInputField(
            hintText: "tell us about Company",
            controller: companyController,
            borderRadius: 50,
            labelText: "Company",
            borderColor: Colors.transparent),
        SizedBox(
          height: 20,
        ),
        CustomListTile(
          leadingWidget: Icon(
            Icons.school,
            color: Colors.white,
          ),
          leadingText: "Educational Level",
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          trailingWidget: widget.selectedEducation != null
              ? Text(
                  widget.selectedEducation!,
                  style: TextStyle(
                      color: MyTheme.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )
              : OnPressedButton(
                  buttonColor: Colors.black,
                  buttonText: "Add",
                  buttonTextColor: Colors.white,
                  onpressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialogBox(
                            options: educationOptions,
                            onOptionSelected: (option) {
                              setState(() {
                                widget.selectedEducation = option;
                              });
                              Navigator.pop(context);
                            },
                            titleColor: Colors.white,
                            actionTextColor: Colors.white,
                            title: "Select your maximum education level",
                          );
                        });
                  },
                  buttonBorderRadius: 50,
                  buttonIcon: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
          borderRadius: 50,
        ),
        SizedBox(
          height: 10,
        ),
        CustomListTile(
          leadingWidget: Icon(
            CupertinoIcons.captions_bubble,
            color: Colors.white,
          ),
          leadingText: "Religion",
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          trailingWidget: widget.selectedReligion != null
              ? Text(
                  widget.selectedReligion!,
                  style: TextStyle(
                      color: MyTheme.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )
              : OnPressedButton(
                  buttonColor: Colors.black,
                  buttonText: "Add",
                  buttonTextColor: Colors.white,
                  onpressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialogBox(
                            options: religionOptions,
                            onOptionSelected: (option) {
                              setState(() {
                                widget.selectedReligion = option;
                              });
                              Navigator.pop(context);
                            },
                            titleColor: Colors.white,
                            actionTextColor: Colors.white,
                            title: "Select your Reliogion",
                          );
                        });
                  },
                  buttonBorderRadius: 50,
                  buttonIcon: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
          borderRadius: 50,
        ),
      ],
    );
  }
}
