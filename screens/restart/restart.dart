import 'package:flutter/material.dart';
import 'package:tetris_new/screens/home/home.dart';

class Restart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton.icon(
          color: Colors.pink,
          onPressed: (){
            Navigator.pushReplacement(
              context, 
              new MaterialPageRoute(
                builder: (BuildContext context) => new Home(),
              ),
            );
          }, 
          icon: Icon(Icons.refresh, color: Colors.white,), 
          label: Text(
            'Restart',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}