import 'package:flutter/material.dart';
import 'package:tetris_new/screens/home/home.dart';
import 'package:tetris_new/screens/restart/restart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}