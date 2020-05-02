import 'package:flutter/material.dart';
import 'package:tetris/screens/home/tetris_tile.dart';

class TetrisRow extends StatelessWidget {

  final List<int> tileValues;
  final Function(int) onTileValueChangedCallback;

  TetrisRow({ this.tileValues, this.onTileValueChangedCallback });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: tileValues.map((tileValue) {
          return (
            TetrisTile(
              tileValue: tileValue,
              onTileValueChange: (tileValue) {
                onTileValueChangedCallback(tileValue);
              },
            )
          );
        }).toList(),
      ),
    );
  }
}