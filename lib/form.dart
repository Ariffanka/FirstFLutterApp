import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FormF extends StatefulWidget {
  const FormF();

  @override
  State<FormF> createState() => _FormFState();
}

class _FormFState extends State<FormF> {
  String teks = "";

  void _alertdialog(String str) {
    if (str.isEmpty) return;

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       content: Text(
    //         str,
    //         style: TextStyle(fontSize: 20.0),
    //       ),
    //     );
    //   },
    // );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            str,
            style: TextStyle(fontSize: 20.0),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        );
      },
    );
  }

  void _snackbar(String str) {
    if (str.isEmpty) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      str,
      style: TextStyle(fontSize: 20.0),
    ),
    duration: Duration(seconds: 3),));
  }

  TextEditingController Icontroller = new TextEditingController();
  TextEditingController Acontroller = new TextEditingController();
  TextEditingController Scontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Icon(
          Icons.abc,
          size: 50.0,
        ),
        toolbarHeight: 50.0,
        actions: [Icon(Icons.search)],
      ),
      body: Container(
          width: 300.0,
          child: Center(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "fill there"),
                  controller: Icontroller,
                  onSubmitted: (String str) {
                    setState(() {
                      teks = str;
                      Icontroller.text = "";
                    });
                  },
                ),
                Text(
                  teks,
                  style: TextStyle(fontSize: 30.0),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "fill there"),
                  controller: Acontroller,
                  onSubmitted: (String str) {
                    _alertdialog(str);
                  },
                ),
                TextField(
                  decoration: InputDecoration(hintText: "fill there"),
                  controller: Scontroller,
                  onSubmitted: (String str) {
                    _snackbar(str);
                  },
                ),
              ],
            ),
          )),
    );
  }
}
