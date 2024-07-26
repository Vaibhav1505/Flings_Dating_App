import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  String chipLabelText;
  Widget? chipAvatar;

  CustomChip({super.key, required this.chipLabelText, this.chipAvatar});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(chipLabelText),
      avatar: CircleAvatar(
        child: chipAvatar,
      ),
    );
  }
}
