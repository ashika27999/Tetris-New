import 'package:flutter/material.dart';
import 'package:tetris_new/screens/home/tetris_tile.dart';

class TetrisRow extends StatefulWidget {

  final List<int> tileValues;
  final Function(int) onTileValueChange;

  TetrisRow({ this.tileValues, this.onTileValueChange });

  @override
  _TetrisRowState createState() => _TetrisRowState();
}

class _TetrisRowState extends State<TetrisRow> {

  List<int> tileValues;

  @override
  void initState() {
    tileValues = widget.tileValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: tileValues.map((tileValue) => TetrisTile(
          tileValue: tileValue, 
          onTileValueChange: (value) { 
            widget.onTileValueChange(value);
          },
        )).toList(),
      ),      
    );
  }
}