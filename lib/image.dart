import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(padding: new EdgeInsets.all(30.0)),
            Text(
              "photo",
              style: TextStyle(fontSize: 30.0),
            ),
            Padding(padding: new EdgeInsets.all(30.0)),
            Image.asset('assets/img/ImageName.jpeg', width: 200.0)
          ],
        ),
      ),
    );
  }
}
