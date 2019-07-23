import 'package:flutter/material.dart';
import 'package:instagram/stories.dart';
import 'chats.dart';
import 'feed.dart';

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
        child: PageView(
          children: <Widget>[
          feed(),
          chats(),
          ],
        ),
    );
  }
}
