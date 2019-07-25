import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_utils/file_utils.dart';

class changeImage extends StatefulWidget {
  @override
  _changeImageState createState() => _changeImageState();
}

class _changeImageState extends State<changeImage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIm(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: Scaffold(
          body:
          Center(
            child: Wrap(
              children: <Widget>[
                Column(
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
                      },
                      child: Text("Change Image"),
                    ),
                    FlatButton(
                      color: Colors.red,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
  File _file;
  var link;
  Future getIm(context) async{

    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _file = image;
    });

    if (_file != null) {
      print(_file.path);
      String FileName = FileUtils.basename(_file.path);
      print(FileName);
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
      Navigator.pop(context);

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
