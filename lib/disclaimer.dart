import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tentang Kami'),
          backgroundColor: Color(0xFFc42e1d),
          // Tambahkan tombol kembali di sini
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Text(
                      'Tentang Aplikasi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Aplikasi Kasir kami dirancang untuk memberikan solusi yang efisien dan canggih dalam mengelola transaksi keuangan bisnis Anda. Dengan antarmuka yang intuitif dan fitur yang dapat disesuaikan, aplikasi ini menjadi mitra ideal bagi pemilik bisnis, manajer, dan karyawan yang ingin meningkatkan efisiensi operasional mereka.\n\nAplikasi ini diperuntukkan internal tim (tidak digunakan untuk umum), akun/user hanya bisa didaftarklan oleh admin yang memiliki toko.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
