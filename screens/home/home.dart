import 'package:flutter/material.dart';
import 'package:tetris_new/screens/home/tetris.dart';
import 'package:tetris_new/screens/restart/restart.dart';
import 'package:tetris_new/shared/initial_config.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
          child: Tetris(
            initalConfig: initialConfig, 
            onEnd: (){
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                  builder: (BuildContext context) => Restart(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}