// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flings_flutter/Themes/themes.dart';
import 'package:flings_flutter/components/CustomListTile.dart';
import 'package:flings_flutter/components/onPressedButton.dart';
import 'package:flings_flutter/pages/Profile/UpdataProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 20,
          ),
          Icon(CupertinoIcons.bell_fill),
          SizedBox(
            width: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: MyTheme.fadedGrey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 80,
                      ),
                      Column(
                        children: [
                          Text(
                            "Username",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 25),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("54649845154545"),
                          SizedBox(
                            height: 15,
                          ),
                          OnPressedButton(
                            buttonText: "Add more about Yourself",
                            buttonTextColor: Colors.black,
                            onpressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateProfile()));
                            },
                            buttonBorderRadius: 50,
                            horizontalPadding: 25,
                            verticalPadding: 15,
                            buttonIcon: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            buttonColor: Colors.white,
                          ),
                        ],
                      )
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: MyTheme.fadedGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    CustomListTile(
                      onTap: () {
                        print("subscription checked");
                      },
                      borderRadius: 50,
                      backgroundColor: Colors.black,
                      leadingText: "My Subscription",
                      titleColor: Colors.white,
                      leadingWidget: Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomListTile(
                      onTap: () {
                        print("contact checked");
                      },
                      borderRadius: 50,
                      backgroundColor: Colors.black,
                      leadingText: "Contact Us",
                      titleColor: Colors.white,
                      leadingWidget: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomListTile(
                      borderRadius: 50,
                      onTap: () {
                        print("privacy checked");
                      },
                      backgroundColor: Colors.black,
                      leadingText: "My Privacy",
                      titleColor: Colors.white,
                      leadingWidget: Icon(
                        CupertinoIcons.lock_shield,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomListTile(
                      borderRadius: 50,
                      onTap: () {
                        print("Terms checked");
                      },
                      backgroundColor: Colors.black,
                      leadingText: "Terms and Conditions",
                      titleColor: Colors.white,
                      leadingWidget: Icon(
                        Icons.document_scanner,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomListTile(
                      borderRadius: 50,
                      onTap: () {
                        print("logout tapped");
                      },
                      backgroundColor: Colors.black,
                      leadingText: "Logout",
                      titleColor: Colors.white,
                      leadingWidget: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
