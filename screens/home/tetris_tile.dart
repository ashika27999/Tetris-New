import 'package:flutter/material.dart';

class TetrisTile extends StatelessWidget {

  final int tileValue;
  final Function(int) onTileValueChange;

  TetrisTile({ this.tileValue, this.onTileValueChange });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 60.0,
        width:60.0,
        child: FlatButton(
          color: tileValue == 0 ? Colors.white : Colors.pink,
          onPressed: () {
            onTileValueChange(tileValue);
          }, 
          child: Text(
            tileValue.toString(),
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}