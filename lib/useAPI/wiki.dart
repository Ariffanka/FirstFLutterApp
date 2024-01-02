import 'dart:convert';
import 'package:first_app/useAPI/add.dart';
import 'package:first_app/useAPI/detail.dart';
import 'package:first_app/useAPI/edit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(WikiPage());
}

class WikiPage extends StatefulWidget {
  @override
  State<WikiPage> createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FireForceWiki',
      home: Wiki(),
    );
  }
}

class Wiki extends StatefulWidget {
  const Wiki({Key? key}) : super(key: key);

  @override
  _WikiState createState() => _WikiState();
}

class _WikiState extends State<Wiki> {
  final String url = "https://cbd5-103-119-50-42.ngrok-free.app/api/";
  final String urlImage = "https://cbd5-103-119-50-42.ngrok-free.app/images/";

  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    getData(); // Panggil fungsi getData saat widget diinisialisasi
  }

  Future getData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        final decodedData = jsonDecode(response.body);
        final dataList = decodedData['data'];
        setState(() {
          data = dataList;
        });
      } catch (e) {
        // Tangani kesalahan
        print(e);
      }
    } else {
      // Tangani kesalahan
      print("data kosong");
    }
  }

  Future deleteD(String produkId) async {
    final String url =
        "https://cbd5-103-119-50-42.ngrok-free.app/api/delete/" + produkId;
    var response = await http.delete(Uri.parse(url));
    var responseData = jsonDecode(response.body);

    if (responseData['message'] == 'berhasil dihapus') {
      setState(() {
        // Hapus item dari daftar data
        data.removeWhere((item) => item['id'].toString() == produkId);
      });

      return responseData;
    } else {
      return responseData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddP()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("WikiKdramaActions"),
        backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          final item = data[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProduct(
                    produk: item,
                  ),
                ),
              );
            },
            child: Card(
              color: Colors.white70,
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Row(
                  children: [
                    Text(item['nama'] ?? ''),
                    Spacer(), // This will push the icon to the right end
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditP(produk: item)));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteD(item['id'].toString()).then((value) {
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(" berhasil dihapus")));
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                subtitle: Text(item['deskP'] ?? ''),
                leading: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(urlImage + item['photo'] ?? ''),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
