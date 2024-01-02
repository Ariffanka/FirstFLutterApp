import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class listV extends StatelessWidget {
  listV({required this.gambar, required this.title, required this.desk});
  final String gambar;
  final String title;
  final String desk;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
          child: Container(
        color: Colors.grey[300],
        child: Row(
          children: [
            Image(
              image: NetworkImage(gambar),
              width: 150.0,
              height: 150.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Center(
                  child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    desk,
                    style: TextStyle(fontSize: 15.0, color: Colors.grey),
                  )
                ],
              )),
            )
          ],
        ),
      )),
    );
  }
}
