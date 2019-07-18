import 'dart:io';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class page2 extends StatefulWidget {
  @override
  _page2State createState() => _page2State();
}

class _page2State extends State<page2> {
  File _file;
  var lin;
  TextEditingController _desc = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    Future getIm() async{
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _file = image;
      });
    }

    Future up() async {
      if (_file != null) {
        String FileName = basename(_file.path);
        StorageReference refer = FirebaseStorage.instance.ref().child(FileName);
        StorageUploadTask upload = refer.putFile(_file);
        StorageTaskSnapshot snap = await upload.onComplete;
        var _lin = refer.getDownloadURL().toString();

        String description = _desc.text;


        try {
          FirebaseUser user = await FirebaseAuth.instance
              .currentUser();

          await Firestore.instance.collection('Posts')
              .document(user.uid)
              .setData(
              {
                'Image': lin,
                'date': DateTime.now(),
                'Description': description,
              });
          /*add({
          'name': _name.text,
          'password': _pwd.text,
          'email': _email.text,
          'phone': _phone.text
        });*/
        }
        catch (e) {
          print(e);
        }
        setState(() {
          lin = _lin;
        });

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

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(

            ),

            child: (_file!=null)?Image.file(_file):Image.asset('images/untitled.png'),
          ),
          
          OutlineButton(
          onPressed: (){
            getIm();
          },
            child: Text("Choose Image"),
          ),
          
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _desc,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter a Beautiful Description For this image ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            ),
          ),
          Expanded(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => maain() ));
                }, child: Text("CANCEL"), color: Colors.blue,),

                FlatButton(onPressed: (){
                  up();
                }, child: Text("POST"), color: Colors.blue)
              ],
            ),
          ),

        ],
      )
    );
  }
}
