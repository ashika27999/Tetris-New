import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:tetris/screens/home/tetris_row.dart';

Function eq = const ListEquality().equals;

class Tetris extends StatefulWidget {

  final List<List<int>> config;

  Tetris({ this.config });

  @override
  _TetrisState createState() => _TetrisState();
}

class _TetrisState extends State<Tetris> {

  List<List<int>> config;

  void deleteTiles(value) {
    for(int i = 0; i < config.length; i++) {
      for(int j = 0; j < config[i].length; j++) {
        if(config[i][j] == value) {
          config[i][j] = 0;
        }
      }
    }
  }
  
  List<int> getBorderValues(indices) {
    List<int> borderValues = List<int>();
    borderValues.addAll([10000, -1, 10000, -1]);
    for(int i = 0; i < indices.length; i++) {
      if(borderValues[0] > indices[i][0]) {
        borderValues[0] = indices[i][0];
      }
      if(borderValues[1] < indices[i][0]) {
        borderValues[1] = indices[i][0];
      }
      if(borderValues[2] > indices[i][1]) {
        borderValues[2] = indices[i][1];
      }
      if(borderValues[3] < indices[i][1]) {
        borderValues[3] = indices[i][1];
      }
    }
    return(borderValues);
  }

  void changeConfig() {
    for(int i = config.length-1; i >= 0; i--) {
      for(int j = 0; j < config[i].length; j++) {

        if(config[i][j] == 0) {
          continue;
        }

        bool added; 
        List<int> currentValues = List<int>();
        List<List<int>> currentValuesIndices;
        List<int> currentValuesBorderValues;
        currentValues.add(config[i][j]);

        do {
          added = false;
          currentValuesIndices = List<List<int>>();

          for(int x = 0; x < config.length; x++) {
            for(int y = 0; y < config[i].length; y++) {
              if(currentValues.contains(config[x][y])) {
                currentValuesIndices.add([x, y]);
              }
            }
          }

          currentValuesBorderValues = getBorderValues(currentValuesIndices);       

          for(int x = currentValuesBorderValues[0]; x <= currentValuesBorderValues[1]; x++) {
            for(int y = currentValuesBorderValues[2]; y < currentValuesBorderValues[3]; y++) {
              if(!currentValues.contains(config[x][y]) && config[x][y] != 0) {
                added = true;
                currentValues.add(config[x][y]);
              }
            }
          }
        } while(added);
        
        bool canMove = true;
        int rowIndex = i;
        int minRowIndex = currentValuesBorderValues[0];
        int maxRowIndex = currentValuesBorderValues[1];
        int minColIndex = currentValuesBorderValues[2];
        int maxColIndex = currentValuesBorderValues[3];
        
        int rowIndex1 = rowIndex + 1;
        int depth = 0;
        bool shouldBreak = false;
        while(shouldBreak == false) {
          for(int colIndex1 = minColIndex; colIndex1 <= maxColIndex; colIndex1++) {
            if(rowIndex1 >= config.length || config[rowIndex1][colIndex1] != 0) {
              shouldBreak = true;
              break;
            }
          }
          if(shouldBreak == true) {
            break;
          }
          else {
            depth += 1;
            rowIndex1 += 1;
          }
        }

        print(currentValues);
        print(depth);

        for(int colIndex = minColIndex; colIndex <= maxColIndex; colIndex++) {
          if(rowIndex < config.length - 1 && config[rowIndex+1][colIndex] != 0) {
            canMove = false;
            break;
          }
        }

        if(canMove == true && rowIndex < config.length - 1) {
          for(int z = 0; z < depth; z++) {
            for(int x = maxRowIndex; x >= minRowIndex; x--) {
              for(int y = minColIndex; y <= maxColIndex; y++) {
                int temp = config[x][y];
                config[x][y] = config[x+1][y];
                config[x+1][y] = temp;
              }
            }
          }   
        }  
      }
    }
  }

  @override
  void initState() {
    config = widget.config;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: config.map((tileValues) {
          return(
            TetrisRow(
              tileValues: tileValues,
              onTileValueChangedCallback: (tileValue) {
                deleteTiles(tileValue);
                changeConfig();
                setState(() {
                  config = config;
                });
              },
            )
          );
        }).toList(),
      ),
    );
  }
}