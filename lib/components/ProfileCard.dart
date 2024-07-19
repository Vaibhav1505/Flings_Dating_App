// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flings_flutter/components/IconOnpressed.dart';
import 'package:flings_flutter/components/onPressedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(80.0),
      child: Card(
        elevation: 8,
        shadowColor: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Stack(
                children: [
                  // ElevatedButton(,onPressed: () {}, child: Icon(Icons.edit)),
                  Image(
                    image: NetworkImage(
                      "https://imgs.search.brave.com/PtyH8zpkcZDkIU4CRdve3CmhMWW0i5oZ0r5tEvanXKA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/d2FsbHBhcGVyc2Fm/YXJpLmNvbS8xLzUw/L2N4VDU5ei5qcGc",
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 5,
                      child: IconOnpressed(
                          buttonColor: Colors.white,
                          icon: Icon(
                            Icons.edit_rounded,
                            color: Colors.black,
                          ),
                          onpressed: () {})),
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Andrew Tate",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Male"),
                    SizedBox(height: 8),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut risus in augue luctus venenatis.",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Intrests",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      child: Column(children: [
                        Text("Jeeadsad"),
                        Divider(
                          color: Colors.green,
                          thickness: 1,
                        ),
                        Text("asdasdasdasd")
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
