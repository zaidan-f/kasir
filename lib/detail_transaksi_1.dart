import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: FutureBuilder(
        future: fetchTransactionData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Map<String, dynamic>> transactions = snapshot.data;
            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('ID Customer: ${transactions[index]['id_customer']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tanggal Transaksi: ${transactions[index]['tanggal_transaksi']}'),
                      Text('Total Harga: ${transactions[index]['total_harga']}'),
                      FutureBuilder(
                        future: fetchDetailData(transactions[index]['id_header_transaksi']),
                        builder: (context, detailSnapshot) {
                          if (detailSnapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (detailSnapshot.hasError) {
                            return Text('Error: ${detailSnapshot.error}');
                          } else {
                            List<Map<String, dynamic>> details = detailSnapshot.data;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: details.map((detail) {
                                return Text('ID Produk: ${detail['id_produk']}, Qty: ${detail['qty']}');
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchTransactionData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('header_transaksi').get();
    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<List<Map<String, dynamic>>> fetchDetailData(String idHeaderTransaksi) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('detail_transaksi')
        .where('id_header_transaksi', isEqualTo: idHeaderTransaksi)
        .get();
    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}
