import 'package:flutter/material.dart';

class MatchingPage extends StatelessWidget {
  const MatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.heart_broken),
              label: Text("Matching"))),
    );
  }
}
