import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/page0.dart';
import 'package:instagram/page1.dart';
import 'package:instagram/page2.dart';
import 'package:instagram/page3.dart';
import 'package:instagram/page4.dart';

class maain extends StatefulWidget {
  @override
  _mainState createState() => _mainState();
}

class _mainState extends State<maain> {
  final List<Widget> pages = [
    page0(
      key: PageStorageKey('Page1'),
    ),
    page1(
      key: PageStorageKey('Page2'),
    ),
    page2(
      key: PageStorageKey('Page3'),
    ),
    page3(
      key: PageStorageKey('Page4'),
    ),
    page4(
      key: PageStorageKey('Page5'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;
  final controller = PageController(initialPage: 0);
  var displayNamee = Firestore().collection('users').document().snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
            PageStorage(
          child: pages[_selectedIndex],
          bucket: bucket,
        ),
        bottomNavigationBar: _bottomNavigationBar(_selectedIndex)

        );
  }

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            title: Text(
              "Search",
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
              color: Colors.black,
            ),
            title: Text(
              "Add",
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_identity,
              color: Colors.black,
            ),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      );
}
