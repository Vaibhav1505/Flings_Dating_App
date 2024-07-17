import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  double? cardHeight, cardWidth;
  String cardTitle;

  CustomCard(
      {super.key, this.cardHeight, this.cardWidth, required this.cardTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: cardHeight,
        width: cardWidth,
        child: Center(child: Text(cardTitle)),
      ),
    );
  }
}
