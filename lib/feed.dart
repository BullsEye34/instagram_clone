import 'package:flutter/material.dart';
import 'package:instagram/stories.dart';

import 'chats.dart';

class feed extends StatefulWidget {
  @override
  _feedState createState() => _feedState();
}

class _feedState extends State<feed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.live_tv),
              onPressed: () {},
            ),
            new IconButton(
              icon: new Icon(Icons.send),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => chats()));
              },
            ),
          ],
          leading: IconButton(icon: Icon(Icons.photo_camera), onPressed: () {}),
          iconTheme: IconThemeData(color: Colors.black),
          title: Image.asset(
            'images/instagram.png',
            scale: 5.0,
          ),
          //Text("Home", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        body: Column(
        children: <Widget>[
          stories(),

        ],
    ),
    )
    );
  }
}