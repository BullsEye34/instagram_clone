import 'package:flutter/material.dart';

class story extends StatefulWidget {
  @override
  _storyState createState() => _storyState();
}

class _storyState extends State<story> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
          width: 90.0,
          height: 90.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('images/untitled.png'),
                  fit: BoxFit.fill)
          )
      ),
    );
  }
}
