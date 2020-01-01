
import 'package:flutter/material.dart';

class UtilWidgets{

  static Widget emptyWidget(){
    return Container();
  }

  static Widget progress() {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

  static Widget gridProgress(){
    return GridView(
      children: <Widget>[
        Center(
        child: CircularProgressIndicator(),
      )

      ], gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), 
    );
  }
}