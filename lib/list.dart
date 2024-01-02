import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import './listV.dart';
import './main.dart' as MainP;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArfApps',
      home: MainP.Home(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => MainP.Home(),
      },
    );
  }
}

class ListP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0,
        backgroundColor: Colors.green[300],
        leading: Icon(
          Icons.abc, // Ganti dengan ikon yang sesuai
          size: 50.0,
        ),
        actions: [
          Icon(
            Icons.search,
            size: 40.0,
          )
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Padding(padding: new EdgeInsets.all(30.0)),
          listV(
              gambar:
                  "https://static.wikia.nocookie.net/hunterxhunter/images/0/06/Gon_Freecss_CA_Portrait.png/revision/latest/scale-to-width-down/130?cb=20190127155206",
              title: "Gon Freecs",
              desk: "MC HxH",
              ),
          listV(
              gambar:
                  "https://static.wikia.nocookie.net/hunterxhunter/images/4/4e/Hisoka_Morow_HCE_Portrait.png/revision/latest/scale-to-width-down/130?cb=20170629131038",
              title: "Hisoka Morrow",
              desk: "Antihero HxH",
              ),
          listV(
              gambar:
                  "https://static.wikia.nocookie.net/hunterxhunter/images/1/1d/Kite_CA_Portrait.png/revision/latest/scale-to-width-down/130?cb=20190127155247",
              title: "Kite Deluxe",
              desk: "Tritagonis HxH",
              ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            }
          , child: Text('go to home page'))
        ],
      )),
    );
  }
}
