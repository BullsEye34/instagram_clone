import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'editProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class page4 extends StatefulWidget {
  const page4({Key key}) : super(key: key);

  @override
  _page4State createState() => _page4State();
}

class _page4State extends State<page4> {
  var userr;
  var userrr;
  var _imageUrl;
  var _interactionCount;
  var num;
  var biooo;

  Widget getUserr() {
    getUser();
    return Text(
      userrr.toString(),
      style: TextStyle(color: Colors.black),
    );
  }

  Future getUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      userr = user.email;
    });
    Firestore.instance
        .collection('users')
        .document(user.uid)
        .get()
        .then((DocumentSnapshot ds) {
      // use ds as a snapshot
      setState(() {
        userrr = ds['name'];
        biooo = ds['bio'];
        _imageUrl = ds['Image'];
      });
    });

    Firestore.instance.collection('Posts').document(user.uid).collection('Posts').getDocuments().then((QuerySnapshot ds) {
      // use ds as a snapshot
      setState(() {
        _interactionCount = ds.documents.length;
      });
    });


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.only(top: 30.0),
            children: <Widget>[
              ListTile(
                title: ButtonTheme(
                  minWidth: 50.0,
                  buttonColor: Colors.blue,
                  child: FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text(
                      "Log Out",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: getUserr(),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                        width: 90.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: //NetworkImage(_imageUrl),
                                (_imageUrl!=null)?NetworkImage(_imageUrl):AssetImage('images/instgram.png'),
                                fit: BoxFit.cover))),
                  ),
                  Wrap(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            _interactionCount.toString(),
                            style:
                                TextStyle(color: Colors.black, fontSize: 30.0),
                          ),
                          Text(
                            "Posts",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Wrap(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "1.9B*",
                            style:
                                TextStyle(color: Colors.black, fontSize: 30.0),
                          ),
                          Text(
                            "Followers",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Wrap(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "1.2k*",
                            style:
                                TextStyle(color: Colors.black, fontSize: 30.0),
                          ),
                          Text(
                            "Following",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30.0,top: 10.0),
                  child: (userrr!=null)?Text(userrr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),):Text("Name"),
                ),
              ],
            ),
            //Text(userrr, style: TextStyle(fontWeight: FontWeight.bold),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30.0, top: 15.0),
                      child: (biooo!=null)?Text(biooo, style: TextStyle(fontSize: 15.0),):Text("Bio"),
                      //Text(biooo, style: TextStyle(fontSize: 15.0), overflow: TextOverflow.clip,),
                    ),
                  ),
                ),

              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ButtonTheme(
                minWidth: 400.0,
                buttonColor: Colors.blue,
                child: OutlineButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => editProfile()));
                  },
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 1.5,
                color: Colors.grey[200],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Posts', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
