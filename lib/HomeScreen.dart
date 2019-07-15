import 'package:flutter/material.dart';
import 'Login.dart';
import 'Register.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('images/instagram.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ButtonTheme(
                    minWidth: 400.0,
                    height: 50.0,
                    child: OutlineButton(
                      onPressed: (){
                        _navigateToNextScreen(context, NewScreen());
                      },
                      child: Text("Log In" , style: TextStyle(fontSize: 20.0),),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0, right: 20.0),
                  child: ButtonTheme(
                    minWidth: 400.0,
                    height: 50.0,
                    child: OutlineButton(
                      onPressed: (){
                        _navigateToNextScreen(context, Register());
                      },
                      child: Text("Sign Up", style: TextStyle(fontSize: 20.0),),
                    ),
                  ),
                )
              ],
            )

          ],
        )
        ),
      );

          /*RaisedButton(
          child: Text(
            'Navigate to a new screen >>',
            style: TextStyle(fontSize: 24.0),
          ),
          onPressed: () {
            _navigateToNextScreen(context);
          },
        )*/
  }
}
  void _navigateToNextScreen(BuildContext context, Widget n) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => n),
    );
  }