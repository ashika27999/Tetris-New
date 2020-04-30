import 'package:flutter/material.dart';

class TetrisTile extends StatefulWidget {

  final int tileValue;
  final Function(int) onTileValueChange;

  TetrisTile({ this.tileValue, this.onTileValueChange });

  @override
  _TetrisTileState createState() => _TetrisTileState();
}

class _TetrisTileState extends State<TetrisTile> {

  int tileValue;

  @override
  void initState() {
    tileValue = widget.tileValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      tileValue = widget.tileValue;
    });
    return Container(
      child: SizedBox(
        height: 55.0,
        width: 55.0,
        child: FlatButton(
          color: tileValue > 0 ? Colors.pink : Colors.white,
          onPressed: (){
            widget.onTileValueChange(tileValue);
          }, 
          child: Text(
            tileValue.toString(),
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            ),
          ),
        ),
      ),      
    );
  }
}