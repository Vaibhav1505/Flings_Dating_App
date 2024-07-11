// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  String? dropDownValue;
  final List<String> dropDownOptions;
  final Color? dropDownBackgroundColor;
  final String hintText;

  CustomDropDown({
    super.key,
    this.dropDownValue,
    required this.dropDownOptions,
    this.dropDownBackgroundColor,
    required this.hintText,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text(widget.hintText),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(CupertinoIcons.down_arrow, color: Colors.black, weight: 25),
      value: widget.dropDownValue,
      items: widget.dropDownOptions.map((String option) {
        return DropdownMenuItem(
          value: option,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getIconForOption(option),
              SizedBox(width: 10),
              Text(
                option,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.dropDownValue = newValue!;
          print(widget.dropDownValue);
        });
      },
    );
  }

  Widget getIconForOption(String option) {
    switch (option) {
      case 'Male':
        return Icon(Icons.man_2_rounded);
      case 'Female':
        return Icon(Icons.woman_2_rounded);
      case 'Prefer not to say':
        return Icon(Icons.person_off); // Or any other suitable icon
      default:
        return SizedBox.shrink(); // Handle default case if needed
    }
  }
}
