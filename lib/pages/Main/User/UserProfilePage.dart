// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flings_flutter/Themes/themes.dart';
import 'package:flings_flutter/components/CustomListTile.dart';
import 'package:flings_flutter/components/IconOnpressed.dart';
import 'package:flings_flutter/components/ProfileCard.dart';
import 'package:flings_flutter/components/onPressedButton.dart';
import 'package:flings_flutter/pages/Profile/UpdataProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List<String> buttonBarItems = [
    'Subscription',
    'My Plan',
    'Profile',
    'Safety and Welbeing'
        'User Account',
    'Setting',
    'Log out'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey[100]),
          width: double.infinity,
          height: double.infinity,
          child: Padding(
              padding: const EdgeInsets.only(top: 260),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "My Plan",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Profile",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Safety and Welbeing",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateProfile(),
                                    ));
                              },
                              child: Text(
                                "Instrests",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomListTile(
                          borderRadius: 50,
                          backgroundColor: Colors.black,
                          leadingWidget: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          leadingText: "Setting",
                          titleColor: Colors.white,
                          trailingWidget: Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomListTile(
                          borderRadius: 50,
                          backgroundColor: Colors.black,
                          leadingWidget: Icon(
                            CupertinoIcons.doc_fill,
                            color: Colors.white,
                          ),
                          leadingText: "Terms and Condition",
                          titleColor: Colors.white,
                          trailingWidget: Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomListTile(
                          borderRadius: 50,
                          backgroundColor: Colors.black,
                          leadingWidget: Icon(
                            Icons.payment,
                            color: Colors.white,
                          ),
                          leadingText: "Billing Details",
                          titleColor: Colors.white,
                          trailingWidget: Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomListTile(
                          borderRadius: 50,
                          backgroundColor: Colors.black,
                          leadingWidget: Icon(Icons.privacy_tip_outlined,
                              color: Colors.white),
                          leadingText: "Privacy and Policy",
                          titleColor: Colors.white,
                          trailingWidget: Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomListTile(
                          borderRadius: 50,
                          backgroundColor: Colors.black,
                          leadingWidget: Icon(
                            Icons.logout_outlined,
                            color: Colors.white,
                          ),
                          leadingText: "Logout",
                          titleColor: Colors.white,
                          trailingWidget: Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          height: 250,
          width: double.infinity,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(
                        'https://imgs.search.brave.com/FDv7MCZA9fchghHQCsNvBCiPMUgWz_JliNHuidR2REU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJjYXZlLmNv/bS93cC93cDExNDg0/MDE1LmpwZw')),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Andrew Bhaiya",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.verified_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "andrewbhaiya@romania.com",
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      "+911234567890",
                      style: TextStyle(color: Colors.white70),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
