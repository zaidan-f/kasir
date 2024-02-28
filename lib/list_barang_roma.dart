import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListBarangWidget extends StatelessWidget {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference produk = FirebaseFirestore.instance.collection('produk');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: produk.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            );
          }

          var produkList = snapshot.data.docs;

          produkList.sort((a, b) {
            var namaProdukA = a.data()['nama_produk'].toString().toLowerCase();
            var namaProdukB = b.data()['nama_produk'].toString().toLowerCase();
            return namaProdukA.compareTo(namaProdukB);
          });

          return ListView.builder(
            itemCount: produkList.length,
            itemBuilder: (context, index) {
              var produkData = produkList[index].data();

              return Container(
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(produkData['nama_produk']),
                  trailing: IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      _showDetailPopUp(context, produkData);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showDetailPopUp(
      BuildContext context, Map<String, dynamic> data) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.info,
              ),
              SizedBox(width: 8),
              Text(
                'Detail Produk',
              ),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nama Produk: ${data['nama_produk']}'),
              Text('Kategori: ${data['kategori_produk']}'),
              Text('Stok: ${data['stok']}'),
              Text('Harga Beli: ${data['harga_beli']}'),
              Text('Harga Jual: ${data['harga_jual']}'),
              Text('Diskon: ${data['diskon']}'),
              Text('Masa Berlaku Diskon: ${data['masa_berlaku_diskon']} hari'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Tutup',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
