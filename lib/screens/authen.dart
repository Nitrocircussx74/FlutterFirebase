import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
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
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.red],
                    begin: Alignment(-1, -1))),
            padding: EdgeInsets.only(top: 30.0),
            alignment: Alignment(0, -1),
            child: Column(
              children: <Widget>[
                showLogo(),
                Container(
                    margin: EdgeInsets.only(top: 15.0), child: showContent()),
              ],
            )));
// ----------------------
  }
}
