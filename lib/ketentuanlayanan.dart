import 'package:flutter/material.dart';

class Ketentuan extends StatelessWidget {
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: Text(
                      'Pernyataan Pemangkalan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Meskipun kami berusaha semaksimal mungkin untuk menyajikan informasi yang akurat, kami tidak menjamin keakuratan, kelengkapan, atau kebaruan informasi. Pengguna bertanggung jawab untuk melakukan verifikasi terkait informasi yang ditemukan di aplikasi ini.\n\nDengan menggunakan aplikasi ini, Anda menyetujui dan menerima semua ketentuan dalam pernyataan pemangkalan ini. Pernyataan pemangkalan ini dapat diperbarui tanpa pemberitahuan sebelumnya, dan pengguna diharapkan untuk memeriksanya secara berkala. Jika Anda tidak setuju dengan ketentuan ini, harap tinggalkan aplikasi ini segera.',
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
