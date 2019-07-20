import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _name = new TextEditingController();
    TextEditingController _pwd = new TextEditingController();
    TextEditingController _email = new TextEditingController();
    TextEditingController _phone = new TextEditingController();


    void signUp() async {
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _email.text, password: _pwd.text);
        await Firestore.instance.collection('users').document(user.uid).setData(
            {
              'name': _name.text,
              'password': _pwd.text,
              'email': _email.text,
              'phone': _phone.text
            });
        user.sendEmailVerification();
        _navigateToNextScreen(context, maain());
      }
      catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),
        title: Text("Register", style: TextStyle(color: Colors.black)
        ),
        backgroundColor: Colors.white,),
      body: Center(
        child: Wrap(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset('images/instagram.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _name,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter Your Name ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _phone,
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Enter Your Phone Number ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _email,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter Your Email ID ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                Padding(
                  padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _pwd,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Your Password ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ButtonTheme(
                      minWidth: 400.0,
                      child: OutlineButton(
                        onPressed: () {
                          signUp();
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    )
                ),
                Padding(
                    padding: EdgeInsets.all(50.0),
                    child: InkWell(
                      child: Text("Already Have an account? Click Here"),
                      onTap: () {
                        _navigateToNextScreen(context, NewScreen());
                      },)
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, Widget n) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => n),
    );
  }
}
