import 'package:flutter/material.dart';
import 'package:tetris/screens/home/tetris.dart';
import 'package:tetris/shared/config.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Tetris(
          config: initialConfig,
        ),
      ),
    );
  }
}