// ignore_for_file: prefer_const_constructors

import 'package:flings_flutter/pages/Main/ChatPage.dart';
import 'package:flings_flutter/pages/Main/UserProfilePage.dart';
import 'package:flings_flutter/pages/Main/Matching.dart';
import 'package:flings_flutter/pages/Main/PeopleList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 3;

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
        backgroundColor: Colors.transparent,
        // fixedColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.list_number,
              color: Colors.grey,
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
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
