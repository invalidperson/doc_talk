import 'package:doc_talk/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'ProfileScreen.dart';
import 'VideoConferenceScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List pageoptions = [VideoConferenceScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal[300],
        selectedLabelStyle: mystyle(17, Colors.teal[300]),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: mystyle(17, Colors.black),
        currentIndex: page,
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call, size: 30),
            label: 'Video Call',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30), label: 'Profile'),
        ],
      ),
      body: pageoptions[page],
    );
  }
}
