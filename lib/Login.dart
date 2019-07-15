import 'package:flutter/material.dart';
import 'Register.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class NewScreen extends StatelessWidget {

  TextEditingController _mailCon = new TextEditingController();
  TextEditingController _pwdCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    void signIn() async{
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _mailCon.text, password: _pwdCon.text);
        _navigateToNextScreen(context, maain(user: user));
      }
      catch(e){
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),
        title: Text("Login", style: TextStyle(color: Colors.black)
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
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _mailCon,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter Your Email ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 2.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: _pwdCon,
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
                        onPressed: (){
                          signIn();
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.all(50.0),
                  child: InkWell(
                    child: Text("Don't Have an account? Click Here"), onTap: () {
                    _navigateToNextScreen(context, Register());
                  },)
                  ,
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

/*
try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _pwd);
        _navigateToNextScreen(context, maain());
      }
      catch(e){
        print(e.message);
      }
      */
