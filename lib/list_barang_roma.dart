import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'form_update.dart';
import 'form.dart';

class ListBarangWidget extends StatelessWidget {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference produk = FirebaseFirestore.instance.collection('produk');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('List Barang'),
      // ),
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

          // var filteredProdukList = snapshot.data.docs.where((produk) {
          //   return produk
          //       .data()['nama_produk']
          //       .toLowerCase()
          //       .contains(searchQuery);
          // }).toList();

          return ListView.builder(
            itemCount: produkList.length,
            itemBuilder: (context, index) {
              var produkData = produkList[index].data();

              return Container(
                margin: EdgeInsets.fromLTRB(
                    10.0, 10.0, 10.0, 10.0), // Margin untuk memberikan padding
                decoration: BoxDecoration(
                  color: Colors.white, // Warna latar belakang
                  borderRadius: BorderRadius.circular(
                      8.0), // Sudut border (sesuaikan dengan kebutuhan Anda)
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // Warna shadow
                      spreadRadius: 2, // Seberapa besar shadow
                      blurRadius: 5, // Seberapa blur shadow
                      offset: Offset(0, 3), // Posisi shadow
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(produkData['nama_produk']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          _showDetailPopUp(context, produkData);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _navigateToUpdateForm(context, produkList[index].id);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _showDeleteConfirmationDialog(
                              context, produkList[index].id);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Fungsi untuk menampilkan pop-up detail produk
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
                // color: Colors.red, // Warna ikon
              ),
              SizedBox(width: 8), // Jarak antara ikon dan teks
              Text(
                'Detail Produk',
                style: TextStyle(
                    // color: Colors.red, // Warna teks
                    ),
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

  void _navigateToUpdateForm(BuildContext context, String productId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormPageUpdate(id: productId),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String productId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Konfirmasi Hapus',
            style: TextStyle(
              color: Colors.red, // Warna teks
            ),
          ),
          content: Text('Apakah Anda yakin ingin menghapus produk ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Batal',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _deleteProduct(productId);
                Navigator.of(context).pop();
              },
              child: Text(
                'Hapus',
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

  void _deleteProduct(String productId) {
    produk.doc(productId).delete();
  }
}
