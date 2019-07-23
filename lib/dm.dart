import 'package:flutter/material.dart';

class dm extends StatefulWidget {
  @override
  _dmState createState() => _dmState();
}

class _dmState extends State<dm> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          width: 60.0,
          height: 90.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('images/untitled.png'),
                  fit: BoxFit.fill))),
      title: Text("Vamshi Prasad"),
      subtitle: Text("Hi"),
      onTap: (){},
    );
  }
}
