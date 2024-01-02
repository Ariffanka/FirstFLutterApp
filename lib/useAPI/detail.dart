import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailProduct extends StatelessWidget {
  final String url = ' https://cbd5-103-119-50-42.ngrok-free.app/images/';
  final Map produk;
  DetailProduct({required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail"),
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 20.0),
              height: 600.0,
              width: 400.0,
              decoration: BoxDecoration(
                color: Colors
                    .white, // Ganti dengan warna latar belakang yang Anda inginkan
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Warna bayangan
                    spreadRadius: 5, // Radius penyebaran bayangan
                    blurRadius: 7, // Radius blur bayangan
                    offset: Offset(0, 3), // Posisi bayangan (x, y)
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.network(url + produk['photo']),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(produk['nama'], 
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold, // Atur sesuai kebutuhan
                            fontSize: 40.0, // Atur ukuran sesuai kebutuhan
                          )),
                          Icon(Icons.edit),
                          Icon(Icons.delete)
                    ],
                  ),
                  Text(produk['deskP'],
                      style: TextStyle(
                        fontFamily: 'Helvetica', // Atur sesuai kebutuhan
                        fontSize: 20.0, // Atur ukuran sesuai kebutuhan
                      )),
                  Text(produk['phone'].toString(),
                      style: TextStyle(
                        fontFamily: 'Courier New',// Atur sesuai kebutuhan
                        fontSize: 20.0, // Atur ukuran sesuai kebutuhan
                      )),
                  // Tambahkan widget lainnya di sini
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
