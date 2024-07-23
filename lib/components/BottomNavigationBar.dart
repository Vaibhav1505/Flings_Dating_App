// ignore_for_file: prefer_const_constructors

import 'package:flings_flutter/pages/Main/Chat/ChatPage.dart';
import 'package:flings_flutter/pages/Main/User/UserProfilePage.dart';
import 'package:flings_flutter/pages/Main/Matching/Matching.dart';
import 'package:flings_flutter/pages/Main/PeopleList/PeopleList.dart';
import 'package:flings_flutter/routes/imageURL.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    PeopleList(),
    MatchingPage(),
    ChatPage(),
    UserProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        // fixedColor: Colors.green,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              APP_LOGO_TRANSPARENT,
              height: 20,
              width: 20,
            ),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.heart_circle,
              color: Colors.grey,
            ),
            label: 'Matching',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Colors.grey,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.grey,
            ),
            label: 'Profile',
          ),
          // BottomNavigationBarItem(icon: Icon(CupertinoIcons.add), label: 'Add')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
