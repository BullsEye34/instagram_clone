import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';

import 'changeImage.dart';
import 'home.dart';

class editProfile extends StatefulWidget {

  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  static var userrr;
  var _imageUrl;
  var link;
  TextEditingController _phoneCon = new TextEditingController(text: "hi");
  var userr;
  TextEditingController _nameCon = new TextEditingController(text: "hi");
  TextEditingController _mailCon = new TextEditingController(text: "hi");
  TextEditingController _bioCon = new TextEditingController(text: "hi");

  @override
  void yourFunction(context) async{

    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('users')
        .document(user.uid)
        .get()
        .then((DocumentSnapshot ds) {
      // use ds as a snapshot
          _nameCon.value = TextEditingController.fromValue(new TextEditingValue(text: ds['name'])).value;

          _phoneCon.value = TextEditingController.fromValue(new TextEditingValue(text: ds['phone'])).value;
          _mailCon.value = TextEditingController.fromValue(new TextEditingValue(text: ds['email'])).value;
          _bioCon.value = TextEditingController.fromValue(new TextEditingValue(text: ds['bio'])).value;
          setState(() {
            _imageUrl = ds['Image'];
          });
    });

  }
  void initState() {
    // TODO: implement initState
    super.initState();
    if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) => yourFunction(context));
    }

  }

  void _navigateToNextScreen(BuildContext context, Widget n) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => n),
    );
  }

  void up() async{
    try {
      FirebaseUser user = await FirebaseAuth.instance
          .currentUser();
      await Firestore.instance.collection('users').document(user.uid).updateData(
          {
            'name': _nameCon.text,
            'phone': _phoneCon.text,
            'email': _mailCon.text,
            'bio': _bioCon.text
          });
      user.updateEmail(_mailCon.text);
      _navigateToNextScreen(context, maain());
    }
    catch (e) {
      print(e);
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
                up();
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
                  /*Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('images/untitled.png'),
                                fit: BoxFit.fill))),


                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                      ),
                      child: Image.network(_imageUrl),
                      //(_file!=null)?Image.file(_file):Image.asset('images/untitled.png')
                    ),
                  ),
                                */

                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: //NetworkImage(_imageUrl),
                                  (_imageUrl!=null)?NetworkImage(_imageUrl):AssetImage('images/instgram.png'),
                                  fit: BoxFit.cover))),
                    ),

                  OutlineButton(
                    onPressed: (){
                      _navigateToNextScreen(context, changeImage());
                    },
                    child: Text("Change Image"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _nameCon,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter Your Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _phoneCon,
                      decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'Enter Your Phone Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _mailCon,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Your Email Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _bioCon,
                      maxLength: 100,
                      maxLines: null,
                      decoration: InputDecoration(
                          labelText: 'Bio',
                          hintText: 'Enter Your Bio',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
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

    if (_file != null) {
      print(_file.path);
      String FileName = _file.path;
      StorageReference ref = FirebaseStorage.instance.ref().child(FileName);
      StorageUploadTask upload = ref.putFile(_file);
      StorageTaskSnapshot snap = await upload.onComplete;

      var dowurl = await (await upload.onComplete).ref.getDownloadURL();

      setState(() {
        link = dowurl.toString();
      });

      try {
        FirebaseUser user = await FirebaseAuth.instance
            .currentUser();

        await Firestore.instance.collection('users')
            .document(user.uid).updateData(
            {
              'Image': link,
            });

      }
      catch (e) {
        print("Errorrrrrrrrrrrr:::::::::::::::::::::::::::::");
        print(e);
      }

      setState(() {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Image Uploaded Sucessfully")));
      });
    }
    else{
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Please select an image")));
    }

  }


}
