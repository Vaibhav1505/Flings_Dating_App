// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoCustomDropDown extends StatefulWidget {
  String? dropDownValue;
  List<String> dropDownOptions;
  Color? dropDownBackgroundColor;
  Icon? icons;
  String hintText;
  DemoCustomDropDown(
      {super.key,
      this.dropDownValue,
      required this.dropDownOptions,
      this.dropDownBackgroundColor,
      required this.hintText,
      this.icons});

  @override
  State<DemoCustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<DemoCustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      DropdownButtonFormField(
          hint: Text(widget.hintText),
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          icon: Icon(
            CupertinoIcons.down_arrow,
            color: Colors.black,
            weight: 25,
          ),
          value: widget.dropDownValue,
          items: widget.dropDownOptions.map((String items) {
            return DropdownMenuItem(
                value: items,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.dropDownBackgroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        items,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      )
                    ],
                  ),
                ));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              widget.dropDownValue = newValue!;
              print(widget.dropDownValue);
            });
          })
    ]);
  }
}
