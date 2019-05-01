import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './register.dart';
import './service.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool _obscureText = true;

  String email, password;

  String tittle = "Please Fill Email ";
  String titleEmail = "Please Fill Email Format";
  String titlePass = "Password too short ";

  String _password;
  // Toggles the password show status

// For Firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// For SnackBar

  final barKey = GlobalKey<ScaffoldState>();

// -------------------------- For Form

  final form = GlobalKey<FormState>();
  // ---------------
  @override
  void initState() {
    super.initState();
    print('Work');
    checkStatus(context);
  }

// --------------
  Future checkStatus(BuildContext context) async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      passToService(context);
    }
  }

// -------------
  void passToService(BuildContext context) {
    var serviceRoute =
        MaterialPageRoute(builder: (BuildContext context) => Service());
    Navigator.of(context)
        .pushAndRemoveUntil(serviceRoute, (Route<dynamic> route) => false);
  }

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
          validator: (String value) {
            if (value.length == 0) {
              return tittle;
            } else if (!((value.contains('@')) && (value.contains(".")))) {
              return titleEmail;
            }
          },
          onSaved: (value) => email = value,
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
                left: 60.0,
              ),
              child: singInbutton(context),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15.0,
                left: 25.0,
              ),
              child: singUpbutton(context),
            ),
          ],
        ));
  }

// ----------------------
  Widget singInbutton(BuildContext context) {
    return Container(
        child: RaisedButton.icon(
      icon: Icon(Icons.beenhere),
      label: Text("Sing In"),
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        print("click");
        if (form.currentState.validate()) {
          form.currentState.save();
          print('email = $email , password = $password');
          check(context);
        }
      },
    ));
  }
// ------------------------------------

// ---------------------------------------
  Widget singUpbutton(BuildContext context) {
    return Container(
        child: RaisedButton.icon(
      icon: Icon(Icons.account_box),
      label: Text("Sing up"),
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => Register()),
        );
      },
    ));
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
        validator: (val) => val.length < 6 ? titlePass : null,
        onSaved: (val) => password = val,
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
  void showSnackBar(String message) {
    SnackBar snackBar = SnackBar(
      duration: Duration(seconds: 10),
      content: Text(message),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
    barKey.currentState.showSnackBar(snackBar);
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

// ----------- check
  void check(BuildContext context) async {
    FirebaseUser firebaseUser = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((res) {
      print('log in ');
      //  Route With Arrow Back
      var ServiceRoute =
          MaterialPageRoute(builder: (BuildContext context) => Service());
      Navigator.of(context)
          .pushAndRemoveUntil(ServiceRoute, (Route<dynamic> route) => false);
    }).catchError((e) {
      String errorString = e.message;
      print('Error!!!!!!!!!!!!!!!!!====> $errorString');
      showSnackBar(errorString);
    });
  }

// -------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: barKey,
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: form,
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
                emailTextField(),
                passTextField(),
                button()
              ],
            ),
          ),
        ));
// ----------------------
  }
}
