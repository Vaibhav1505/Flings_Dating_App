import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PeopleList extends StatefulWidget {
  const PeopleList({super.key});

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(CupertinoIcons.list_number_rtl),
          label: Text("People List")),
    ));
  }
}
