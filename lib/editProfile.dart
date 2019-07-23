import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController _nameCon;
  @override
  void yourFunction(context){
    _nameCon.text="Helooooo";
    _nameCon.value = TextEditingController.fromValue(new TextEditingValue(text: "My String")).value;
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) => yourFunction(context));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.check),
              onPressed: () {
                
              },
            ),
          ],
          leading: IconButton(icon: Icon(Icons.close), onPressed: () {
            Navigator.pop(context);
          }),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Edit Profile", style: TextStyle(color: Colors.black),),
          //Text("Home", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: /*Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('images/untitled.png'),
                                fit: BoxFit.fill))),*/
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                      ),
                      child: (_file!=null)?Image.file(_file):Image.asset('images/untitled.png'),
                    ),
                  ),
                  OutlineButton(
                    onPressed: (){
                      getIm();
                    },
                    child: Text("Change Image"),
                  ),
                  TextField(
                    controller: _nameCon,

                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  File _file;
  Future getIm() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _file = image;
    });
  }
}
