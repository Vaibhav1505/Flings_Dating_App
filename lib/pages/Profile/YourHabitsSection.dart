// ignore_for_file: prefer_const_constructors

import 'package:flings_flutter/Themes/themes.dart';
import 'package:flings_flutter/components/CustomDiallogBox.dart';
import 'package:flings_flutter/components/CustomListTile.dart';
import 'package:flings_flutter/components/onPressedButton.dart';
import 'package:flings_flutter/data/options.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YourHabitsSection extends StatefulWidget {
  String? drinking;
  String? smoking;
  String? workout;
  String? diet;
  String? socialMedia;

  YourHabitsSection(
      {super.key,
      this.drinking,
      this.smoking,
      this.diet,
      this.workout,
      this.socialMedia});

  @override
  State<YourHabitsSection> createState() => _YourHabitsSectionState();
}

class _YourHabitsSectionState extends State<YourHabitsSection> {
  String? drinking;
  String? smoking;
  String? workout;
  String? diet;
  String? socialMedia;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              "Your Habits",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 35,
                  foreground: Paint()..shader = MyTheme.linearGradientColor),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        CustomListTile(
          leadingWidget: Icon(
            Icons.water,
            color: Colors.white,
          ),
          leadingText: "Drinking",
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          trailingWidget: widget.drinking != null
              ? Text(
                  widget.drinking!,
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
                            options: drinkingOptions,
                            onOptionSelected: (option) {
                              setState(() {
                                widget.drinking = option;
                              });
                              Navigator.pop(context);
                            },
                            titleColor: Colors.white,
                            actionTextColor: Colors.white,
                            title: "How often do you Drink?",
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
            Icons.smoke_free,
            color: Colors.white,
          ),
          leadingText: "Smoking",
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          trailingWidget: widget.smoking != null
              ? Text(
                  widget.smoking!,
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
                            options: smokingOptions,
                            onOptionSelected: (option) {
                              setState(() {
                                widget.smoking = option;
                              });
                              Navigator.pop(context);
                            },
                            titleColor: Colors.white,
                            actionTextColor: Colors.white,
                            title: "How often do you Drink?",
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
            Icons.food_bank,
            color: Colors.white,
          ),
          leadingText: "Dietry Preference",
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          trailingWidget: widget.diet != null
              ? Text(
                  widget.diet!,
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
                            options: foodOptions,
                            onOptionSelected: (option) {
                              setState(() {
                                widget.diet = option;
                              });
                              Navigator.pop(context);
                            },
                            titleColor: Colors.white,
                            actionTextColor: Colors.white,
                            title: "How often do you Drink?",
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
            Icons.sports_gymnastics,
            color: Colors.white,
          ),
          leadingText: "Exrcising Habit",
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          trailingWidget: widget.workout != null
              ? Text(
                  widget.workout!,
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
                            options: workoutOptions,
                            onOptionSelected: (option) {
                              setState(() {
                                widget.workout = option;
                              });
                              Navigator.pop(context);
                            },
                            titleColor: Colors.white,
                            actionTextColor: Colors.white,
                            title: "How often do you Drink?",
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
            Icons.facebook,
            color: Colors.white,
          ),
          leadingText: "Social Media",
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          trailingWidget: widget.socialMedia != null
              ? Text(
                  widget.socialMedia!,
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
                            options: socialMediaOptions,
                            onOptionSelected: (option) {
                              setState(() {
                                widget.socialMedia = option;
                              });
                              Navigator.pop(context);
                            },
                            titleColor: Colors.white,
                            actionTextColor: Colors.white,
                            title: "How often do you Drink?",
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
        )
      ],
    );
  }
}
