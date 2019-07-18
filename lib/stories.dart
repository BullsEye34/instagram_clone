import 'package:flutter/material.dart';
import 'package:instagram/story.dart';

class stories extends StatefulWidget {
  @override
  _storiesState createState() => _storiesState();
}

class _storiesState extends State<stories> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          story(),
          story(),
          story(),
          story(),
          story(),
          story(),
          story(),
          story(),
          story(),
          story(),
          story(),
          story(),
          story(),
          story(),
        ],
      ),
    );
  }
}
