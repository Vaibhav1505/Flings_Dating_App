// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flings_flutter/components/CardStackWidget.dart';
import 'package:flings_flutter/pages/Main/PeopleList/BackgroundDesingCurve.dart';
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
        body: Stack(
      children: [BackgroundDesignCurve(), CardStackWidget()],
    ));
  }
}
