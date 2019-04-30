import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;

  String _password;

// --------------
  Widget nameTextField() {
    return Container(
        margin: EdgeInsets.only(left: 1.0, top: 20.0),
        width: 230.0,
        child: TextFormField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 1.0)),
              labelText: "Name: ",
              hintText: "Type Your Name",
              icon: const Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: const Icon(Icons.face))),
        ));
  }

  // --------------------------
  Widget emailTextField() {
    return Container(
        margin: EdgeInsets.only(left: 1.0, top: 20.0),
        width: 230.0,
        child: TextFormField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 1.0)),
              labelText: "Email: ",
              hintText: 'exmple@gmail.com',
              icon: const Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: const Icon(Icons.local_post_office))),
        ));
  }

  // --------------
  Widget passTextField() {
    return Container(
      margin: EdgeInsets.only(left: 1.0, top: 20.0),
      width: 230.0,
      child: TextFormField(
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(width: 1.0)),
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
// ----------------------
  Widget singUpbutton() {
    return Container(
        margin: EdgeInsets.only(
          top: 15.0,
          left: 20.0,
        ),
        width: 100.0,
        child: RaisedButton(
            color: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {},
            child: Text("Sing Up")));
  }

  // Widget showLogo() {
  //   return Container(
  //       width: 200.0, height: 200.0, child: Image.asset('images/giphy.webp'));
  // }

// ---------------------------
  // Widget showName() {
  //   return Text(
  //     'Fluter',
  //     style: TextStyle(
  //       fontSize: 32,
  //       color: Colors.black87,
  //     ),
  //   );
  // }

// ----------------------------r
  // Widget showContent() {
  //   return Text(
  //     'is real',
  //     style: TextStyle(
  //       fontFamily: 'GloriaHallelujah',
  //       fontSize: 32,
  //       // fontWeight: FontWeight.bold,
  //       color: Colors.black87,
  //     ),
  //   );
  // }

// -----------
  // Widget showfooter() {
  //   return Text(
  //     'real',
  //     style: TextStyle(
  //       fontFamily: 'GloriaHallelujah',
  //       fontSize: 32,
  //       // fontWeight: FontWeight.bold,
  //       color: Colors.black87,
  //     ),
  //   );
  // }

// -------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "register",
          style: TextStyle(
            fontFamily: 'GloriaHallelujah',
            fontSize: 26,
            // fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.red], begin: Alignment(-1, -1))),
        padding: EdgeInsets.all(90.0),
        child: Column(
          children: <Widget>[
            nameTextField(),
            emailTextField(),
            passTextField(),
            singUpbutton()
          ],
        ),
      ),
    );
// ----------------------
  }
}
