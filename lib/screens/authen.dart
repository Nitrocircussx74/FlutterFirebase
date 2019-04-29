import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool _obscureText = true;

  String _password;
  // Toggles the password show status

// --------------
  Widget emailTextField() {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        width: 230.0,
        child: TextFormField(
          decoration: InputDecoration(
              labelText: "Email: ",
              hintText: 'exmple@gmail.com',
              icon: const Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: const Icon(Icons.local_post_office))),
        ));
  }

// ---------------
  Widget button() {
    return Container(
        margin: EdgeInsets.only(
          top: 15.0,
          left: 30.0,
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 15.0,
                left: 90.0,
              ),
              child: singInbutton(),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15.0,
                left: 30.0,
              ),
              child: singUpbutton(),
            ),
          ],
        ));
  }

// ----------------------
  Widget singInbutton() {
    return Container(
        child: RaisedButton(
            color: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {},
            child: Text("Sing In")));
  }

  Widget singUpbutton() {
    return Container(
        child: RaisedButton(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {},
            child: Text("Sing up")));
  }

  // --------------
  Widget passTextField() {
    return Container(
      width: 230.0,
      child: TextFormField(
        decoration: const InputDecoration(
            labelText: 'Password:',
            icon: const Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: const Icon(Icons.lock))),
        validator: (val) => val.length < 6 ? 'Password too short.' : null,
        onSaved: (val) => _password = val,
        obscureText: _obscureText,
      ),
    );
  }

  // -------------------------------------
  Widget showLogo() {
    return Container(
        width: 200.0, height: 200.0, child: Image.asset('images/giphy.webp'));
  }

// ---------------------------
  Widget showName() {
    return Text(
      'Fluter',
      style: TextStyle(
        fontSize: 32,
        color: Colors.black87,
      ),
    );
  }

// ----------------------------r
  Widget showContent() {
    return Text(
      'is real',
      style: TextStyle(
        fontFamily: 'GloriaHallelujah',
        fontSize: 32,
        // fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

// -----------
  Widget showfooter() {
    return Text(
      'real',
      style: TextStyle(
        fontFamily: 'GloriaHallelujah',
        fontSize: 32,
        // fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

// -------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.red], begin: Alignment(-1, -1))),
          padding: EdgeInsets.only(top: 30.0),
          alignment: Alignment(0, -1),
          child: Column(
            children: <Widget>[
              showLogo(),
              Container(
                  margin: EdgeInsets.only(top: 15.0), child: showContent()),
              emailTextField(),
              passTextField(),
              button()
            ],
          ),
        ));
// ----------------------
  }
}
