import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Music extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Padding(padding: new EdgeInsets.all(30.0)),
          Text(
            "music",
            style: TextStyle(fontSize: 30.0),
          ),
          Padding(padding: new EdgeInsets.all(30.0)),
          Image.asset(
            'assets/img/songName.jpg',
            width: 200.0,
          )
        ],
      )),
    );
  }
}
