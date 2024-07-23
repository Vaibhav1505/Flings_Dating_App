import 'package:flings_flutter/Themes/themes.dart';
import 'package:flings_flutter/components/onPressedButton.dart';
import 'package:flings_flutter/components/optionContainer.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  final List<String> options;
  final String title;
  Color? actionTextColor, titleColor;

  void Function(String option)? onOptionSelected;

  CustomDialogBox(
      {super.key,
      required this.options,
      this.titleColor,
      required this.title,
      this.actionTextColor,
      this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (context, index) {
            return _buildOptionWidget(options[index]);
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(
                color: actionTextColor ?? Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionWidget(String option) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: OptionContainer(
        leadingColor: Colors.black,
        onTap: () {
          print("$option tapped, Widget:CustomDialogBox");

          if (onOptionSelected != null) {
            onOptionSelected!(option);
            print(option);
          }
        },
        title: option,
        backgroundColor: Colors.white,
        borderRadius: 50,
      ),
    );
  }
}



// OnPressedButton(
//           buttonText: option,
//           buttonPadding: 25,
//           onpressed: () {
//             print("$option selected");
//           },
//           buttonBorderRadius: 50,
//           buttonTextColor: Colors.white,
//           buttonColor: Colors.black,
//           buttonIcon: Icon(Icons.abc))
