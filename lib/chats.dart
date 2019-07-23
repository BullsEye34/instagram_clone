import 'package:flutter/material.dart';

import 'dm.dart';
import 'home.dart';

class chats extends StatefulWidget {
  @override
  _chatsState createState() => _chatsState();
}

class _chatsState extends State<chats> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => maain()));
                    }
                  }),
              iconTheme: IconThemeData(color: Colors.black),
              title: Text(
                "Direct",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              actions: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.video_call),
                  onPressed: () {},
                ),
                new IconButton(
                  icon: new Icon(Icons.note_add),
                  onPressed: () {},
                ),
              ],
            ),
            body: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Search',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Text(
                  "Messages",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: new CustomScrollView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    slivers: <Widget>[
                      new SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                        sliver: new SliverList(
                          delegate: new SliverChildBuilderDelegate(
                                (context, index) => new dm(),
                            childCount: 55,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}

//Stack(children: <Widget>[dm()],),Stack(children: <Widget>[dm()],),Stack(children: <Widget>[dm()],),Stack(children: <Widget>[dm()],),Stack(children: <Widget>[dm()],),Stack(children: <Widget>[dm()],),Stack(children: <Widget>[dm()],),Stack(children: <Widget>[dm()],),Stack(children: <Widget>[dm()],),Stack(children: <Widget>[dm()],),Stack(children: <Widget>[dm()],),Stack(children: <Widget>[dm()],),Stack(children: <Widget>[dm()],),
//