import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
// ---------------------------
  Widget showName() {
    return Text('Fluter');
  }

// -------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 30.0),
      alignment: Alignment(0, -1),
      child: showName(),
    ));
// ----------------------
    // return Container(
    //   decoration: BoxDecoration(color: Colors.white),
    //   child: Center(
    //     child: Text(
    //       'This is  World',
    //       style: TextStyle(
    //         fontSize: 32,
    //         color: Colors.black87,
    //       ),
    //     ),
    //   ),
    // );
  }
}
