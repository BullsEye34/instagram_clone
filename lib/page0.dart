import 'package:flutter/material.dart';
import 'package:instagram/stories.dart';

class page0 extends StatefulWidget {
  const page0({Key key}) : super(key: key);
  @override
  _page0State createState() => _page0State();
}

class _page0State extends State<page0> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.live_tv),
              onPressed: () {},
            ),
            new IconButton(
              icon: new Icon(Icons.send),
              onPressed: () {},
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
    ));
  }
}
