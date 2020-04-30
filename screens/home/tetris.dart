import 'package:flutter/material.dart';
import 'package:tetris_new/screens/home/tetris_row.dart';

class Tetris extends StatefulWidget {

  final List<List<int>> initalConfig;
  final VoidCallback onEnd;

  Tetris({ this.initalConfig, this.onEnd });

  @override
  _TetrisState createState() => _TetrisState();
}

class _TetrisState extends State<Tetris> {

  List<List<int>> config;

  bool checkEnd() {
    for(int i = 0; i < config.length; i++) {
      for(int j = 0; j < config[i].length; j++) {
        if(config[i][j] != 0) {
          return(false);
        }
      }
    }
    return(true);
  }

  List<List<int>> moveBlocks(config) {
    for(int i = config.length - 2; i >= 0; i--) {
      for(int j = 0; j < config[i].length; j++) {
        if (config[i+1][j] == 0) {
          int currentValue = 5;
          int currentCount = 0;
          for(int x = 0; x < config[i].length; x++) {
            if(config[i][x] == currentValue) {
              currentCount += 1;
            }
          }
          int maxCount = currentCount;
          for(int k = i - 1; k >= 0; k--) {
            int count = 0;
            for(int l = 0; l < config[k].length; l++) {
              if(config[i][l] == currentValue) {
                count += 1;
              }
            }
            if (count >= maxCount) {
              maxCount = count;
            }
          }
          if (maxCount == currentCount) {
            int temp = config[i][j];
            config[i][j] = config[i+1][j];
            config[i+1][j] = temp;
          }
        }
      }
    }
    return(config);
  }

  @override
  void initState() {
    config = widget.initalConfig;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: config.map((tileRow) => TetrisRow(
          tileValues: tileRow, 
          onTileValueChange: (value) { 
            List<List<int>> tempConfig = config;
            for(int i = 0; i < config.length; i++) {
              for(int j = 0; j < config[i].length; j++) {
                if(tempConfig[i][j] == value) {
                  tempConfig[i][j] = 0;
                }
              }
            }
            tempConfig = moveBlocks(tempConfig);
            setState(() {
              config = tempConfig;
            });
            // print(config);
            checkEnd() == true ? widget.onEnd() : null;
          },
        )).toList(),
      ),
    );
  }
}