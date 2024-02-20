import 'package:flutter/material.dart';
import 'home_roma.dart';

class Produk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tap Untuk ke Halaman Beranda'),
      // child: RaisedButton(
      //   onPressed: () {
      //     Route route = MaterialPageRoute(builder: (context) => BerandaPage());
      //     Navigator.push(context, route);
      //   },
      //   child: Text('Tap Untuk ke Halaman Beranda'),
      // ),
    );
  }
}