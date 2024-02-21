// import 'package:flutter/material.dart';

// class DetailsTransaksiWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text('Durapos'),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Product',
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                           SizedBox(width: 60),
//                           Text('Qty',
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                           SizedBox(width: 55),
//                           Text('Total',
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                           SizedBox(width: 60),
//                           Text('Option',
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           _buildProductRow(
//                               'Mi Goreng', '2', 'Rp 10.000', context),
//                           _buildProductRow(
//                               'Mi Goreng', '8', 'Rp 10.000', context),
//                           _buildProductRow(
//                               'Mi Goreng', '2', 'Rp 10.000', context),
//                           _buildProductRow(
//                               'Mi Goreng', '2', 'Rp 10.000', context),
//                           _buildProductRow(
//                               'Mi Goreng', '2', 'Rp 10.000', context),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProductRow(
//       String productName, String quantity, String total, BuildContext context) {
//     return Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             productName,
//             style: Theme.of(context).textTheme.bodyText1,
//           ),
//           SizedBox(width: 60),
//           Text(
//             quantity,
//             style: Theme.of(context).textTheme.bodyText1,
//           ),
//           SizedBox(width: 55),
//           Text(
//             total,
//             style: Theme.of(context).textTheme.bodyText1,
//           ),
//           SizedBox(width: 60),
//           Row(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.edit),
//                 onPressed: () {
//                   print('Edit button pressed');
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () {
//                   print('Delete button pressed');
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class DetailsTransaksiWidget extends StatelessWidget {
  final String idHeaderTransaksi;

  DetailsTransaksiWidget({this.idHeaderTransaksi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Durapos'),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('detail_transaksi')
            .where('id_header_transaksi', isEqualTo: idHeaderTransaksi)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          List<DocumentSnapshot> detailTransaksiDocs = snapshot.data.docs;

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Product',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 60),
                              Text('Qty',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 55),
                              Text('Total',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 60),
                              Text('Option',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: detailTransaksiDocs.map((doc) {
                              final productName = doc['nama_produk'];
                              final quantity = doc['qty'];
                              final total = doc['total'];

                              return _buildProductRow(
                                  productName,
                                  quantity.toString(),
                                  total.toString(),
                                  context);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductRow(
    String productName,
    String quantity,
    String total,
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            productName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(width: 60),
          Text(
            quantity,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(width: 55),
          Text(
            total,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(width: 60),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  print('Edit button pressed');
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  print('Delete button pressed');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
