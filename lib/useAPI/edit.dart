import 'dart:convert';

import 'package:first_app/main.dart';
import 'package:first_app/useAPI/wiki.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class EditP extends StatelessWidget {
  final Map produk;

  EditP({required this.produk});

  final _form = GlobalKey<FormState>();
  TextEditingController _nama = TextEditingController();
  TextEditingController _deskP = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _photo = TextEditingController();

  Future UpdateD() async {
    final response = await http.put(
        Uri.parse("https://cbd5-103-119-50-42.ngrok-free.app/api/update/" +
            produk['id'].toString()),
        body: {
          "nama": _nama.text,
          "deskP": _deskP.text,
          "phone": _phone.text,
          "photo": _photo.text,
        });
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("EditPage"),
        backgroundColor: Colors.grey[900],
      ),
      body: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                controller: _nama..text = produk['nama'],
                decoration: InputDecoration(label: Text("nama")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please fill the input!";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _deskP..text = produk['deskP'],
                decoration: InputDecoration(label: Text("deskripsi")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please fill the input!";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phone..text = produk['phone'].toString(),
                decoration: InputDecoration(label: Text("nomor hp")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please fill the input!";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _photo..text = produk['photo'],
                decoration: InputDecoration(label: Text("url image")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please fill the input!";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    UpdateD().then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Wiki()));
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("berhasil diupdate")));
                    });
                  } else {
                    print("gagal update data");
                  }
                },
                child: Text("update"),
              )
            ],
          )),
    );
  }
}
