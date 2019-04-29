import 'package:flutter/material.dart';
import './screens/authen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Firebase",
      // theme: new ThemeData(
      //   primarySwatch: Colors.red,
      // ),
      home: Authen(),
    );
  }
}
