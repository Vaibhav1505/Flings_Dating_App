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
  String? selectedDrinks;
  String? selectedSmoke;
  String? selectedExcercisingHabit;
  String? selectedDiet;
  String? selectedSocialMedia;

  YourHabitsSection(
      {super.key,
      this.selectedDrinks,
      this.selectedSmoke,
      this.selectedDiet,
      this.selectedExcercisingHabit,
      this.selectedSocialMedia});

  @override
  State<YourHabitsSection> createState() => _YourHabitsSectionState();
}

class _YourHabitsSectionState extends State<YourHabitsSection> {
  String? selectedDrinks;
  String? selectedSmoke;
  String? selectedExcercisingHabit;
  String? selectedDiet;
  String? selectedSocialMedia;

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
          trailingWidget: widget.selectedDrinks != null
              ? Text(
                  widget.selectedDrinks!,
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
                                widget.selectedDrinks = option;
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
          trailingWidget: widget.selectedSmoke != null
              ? Text(
                  widget.selectedSmoke!,
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
                                widget.selectedSmoke = option;
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
          trailingWidget: widget.selectedDiet != null
              ? Text(
                  widget.selectedDiet!,
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
                                widget.selectedDiet = option;
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
          trailingWidget: widget.selectedExcercisingHabit != null
              ? Text(
                  widget.selectedExcercisingHabit!,
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
                                widget.selectedExcercisingHabit = option;
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
          trailingWidget: widget.selectedSocialMedia != null
              ? Text(
                  widget.selectedSocialMedia!,
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
                                widget.selectedSocialMedia = option;
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
