import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';

class Service extends StatefulWidget {
  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String name, email, password;

// For Firebase
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }
  // ----read db

  void read() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String Uid = firebaseUser.uid.toString();
    var data = firebaseDatabase.reference().child(Uid);

    // String name = data.onValue
  }

// For SnackBar

  final snackBarKey = GlobalKey<ScaffoldState>();

  bool _obscureText = true;
// ----- sign out

  Widget signOutButton() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        print("logout");
        signOutProcess(context);
      },
    );
  }

// -------------------
  void signOutProcess(BuildContext context) async {
    //  exit app sing out
    await firebaseAuth.signOut();
    exit(0);
  }

// --------------
  Widget showLogo() {
    return Container(
        width: 200.0, height: 200.0, child: Image.asset('images/giphy.gif'));
  }
// -------------------------------------------

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
  // --------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            "Service",
            style: TextStyle(
              fontFamily: 'GloriaHallelujah',
              fontSize: 26,
              // fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          actions: <Widget>[Image.asset('images/giphy.webp'), signOutButton()],
        ),
        body: Form(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.white],
                    begin: Alignment(-1, -1))),
            padding: EdgeInsets.only(top: 30.0),
            alignment: Alignment(0, -1),
            child: Column(
              children: <Widget>[
                showLogo(),
                Container(
                    margin: EdgeInsets.only(top: 15.0), child: showContent()),
              ],
            ),
          ),
        ));
// ----------------------
  }
}
