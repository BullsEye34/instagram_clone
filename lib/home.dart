import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class maain extends StatefulWidget {
  const maain(
      {Key key,
        this.user}
        ) : super(
      key: key);
  final FirebaseUser user;


  @override
  _mainState createState() => _mainState();
}

class _mainState extends State<maain> {

  var displayNamee = Firestore().collection('users').document().snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Hi ${widget.user.email}", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
    );
  }
}
