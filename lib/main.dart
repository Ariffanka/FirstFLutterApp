import 'package:flutter/material.dart';

import './indexPage.dart' as indexPage;
import './list.dart' as ListP;
import './form.dart' as FormP;
import './useAPI/wiki.dart' as WikiP;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArfApps',
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(),
        '/test': (BuildContext context) => Music(),
        '/index': (BuildContext context) => indexPage.IndexPage(),
        '/listP': (BuildContext context)=> ListP.ListP(),
        '/form':(BuildContext context)=> FormP.FormF(),
        '/wiki':(BuildContext context)=> WikiP.Wiki()
      },
    );
  }
}

class Home extends StatelessWidget {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyCard(icon: Icons.store, desk: "store", warna: Colors.brown),
          MyCard(icon: Icons.home, desk: "home", warna: Colors.yellow),
          MyCard(
              icon: Icons.card_membership,
              desk: "card membership",
              warna: Colors.blue),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/test');
            },
            child: Text('Go to music page'),
          ),
           TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/form');
            },
            child: Text('Go to form page'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/wiki');
            },
            child: Text('Go to wiki page'),
          ),
          
        ],
      ),
    );
  }
}

class Music extends StatelessWidget {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyCard(
              icon: Icons.music_note, desk: "musik note", warna: Colors.black),
          MyCard(
              icon: Icons.headphones, desk: "headphones", warna: Colors.grey),
          MyCard(icon: Icons.mic, desk: "mic", warna: Colors.blueAccent),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Text('Go to home page'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/index');
            },
            child: Text('Go to index'),
          ),
           TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/listP');
            },
            child: Text('Go to list'),
          )
        ],
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  MyCard({required this.icon, required this.desk, required this.warna});

  final IconData icon;
  final String desk;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Card(
        child: Column(
          children: [
            Icon(
              icon,
              size: 50.0,
              color: warna,
            ),
            Text(
              desk,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
