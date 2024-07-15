// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  String? dropDownValue;
  final List<String> dropDownOptions;
  final Color? dropDownBackgroundColor;

  final Color? hintTextColor;
  final String hintText;
  final ValueChanged<String?>? onChanged;
  CustomDropDown({
    // required this.onChanged,
    super.key,
    this.onChanged,
    this.dropDownValue,
    required this.dropDownOptions,
    this.dropDownBackgroundColor,
    this.hintTextColor,
    required this.hintText,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text(
        widget.hintText,
        style: TextStyle(color: Colors.white),
      ),
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 2,
              color: Colors.white,
            )),
      ),
      icon: Icon(
        CupertinoIcons.arrow_down_circle,
        color: Colors.white,
      ),
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
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
        // setState(() {
        //   widget.dropDownValue = newValue!;
        //   print(widget.dropDownValue);
        // });
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
