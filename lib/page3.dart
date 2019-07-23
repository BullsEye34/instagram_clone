import 'package:flutter/material.dart';

class page3 extends StatefulWidget {
  const page3({Key key}) : super(key: key);
  @override
  _page3State createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(DateTime.now().toIso8601String());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,

    );
  }
}
