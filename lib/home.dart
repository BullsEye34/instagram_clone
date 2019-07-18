
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
  int ScreenIndex = 0;
  final controller = PageController(
    initialPage: 0
  );
  var displayNamee = Firestore().collection('users').document().snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.live_tv), onPressed: (){},
          ),
          new IconButton(
            icon: new Icon(Icons.send), onPressed: (){},
          ),
        ],
        leading: IconButton(icon: Icon(Icons.photo_camera), onPressed: (){}),
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset('images/instagram.png',scale: 5.0,) ,
        //Text("Home", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),


      body: PageView(
        controller: controller,
        children: <Widget>[
          page0(),
          page1(),
          page2(),
          page3(),
          page4()

        ],
      ),


      bottomNavigationBar: 
        BottomNavigationBar(
          onTap: (int _value){
            setState(() {
              ScreenIndex = _value;
            });
          },
            currentIndex: ScreenIndex,

            items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black,),
            title: Text("Home",style: TextStyle(color: Colors.black),),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black,),
            title: Text("Search", style: TextStyle(color: Colors.black),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box, color: Colors.black,),
            title: Text("Add", style: TextStyle(color: Colors.black),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: Colors.black,),
            title: Text("Notifications", style: TextStyle(color: Colors.black),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity, color: Colors.black,),
            title: Text("Profile", style: TextStyle(color: Colors.black),),
          ),

        ]
        )
    );
  }
}
