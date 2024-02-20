// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'form.dart';

// class ListBarangWidget extends StatefulWidget {
//   const ListBarangWidget({Key key}) : super(key: key);

//   @override
//   _ListBarangWidgetState createState() => _ListBarangWidgetState();
// }

// class _ListBarangWidgetState extends State<ListBarangWidget> {
//   final List<Map<String, String>> itemList = [
//     {'name': 'Botol Minum', 'stock': '100', 'hargaBeli': 'Rp.10.000', 'hargaJual': 'Rp.10.000'},
//     {'name': 'Minyak', 'stock': '100', 'hargaBeli': 'Rp.10.000', 'hargaJual': 'Rp.10.000'},
//     {'name': 'Minyak', 'stock': '100', 'hargaBeli': 'Rp.10.000', 'hargaJual': 'Rp.10.000'},
//     {'name': 'Gula', 'stock': '100', 'hargaBeli': 'Rp.10.000', 'hargaJual': 'Rp.10.000'},
//     {'name': 'Botol Minum', 'stock': '100', 'hargaBeli': 'Rp.10.000', 'hargaJual': 'Rp.10.000'},
//     {'name': 'Minyak', 'stock': '100', 'hargaBeli': 'Rp.10.000', 'hargaJual': 'Rp.10.000'},
//     {'name': 'Botol Minum', 'stock': '100', 'hargaBeli': 'Rp.10.000', 'hargaJual': 'Rp.10.000'},
//     {'name': 'Minyak', 'stock': '100', 'hargaBeli': 'Rp.10.000', 'hargaJual': 'Rp.10.000'},
//     {'name': 'Botol Minum', 'stock': '100', 'hargaBeli': 'Rp.10.000', 'hargaJual': 'Rp.10.000'},
//     {'name': 'Minyak', 'stock': '100', 'hargaBeli': 'Rp.10.000', 'hargaJual': 'Rp.10.000'},
//     {'name': 'Botol Minum', 'stock': '100', 'hargaBeli': 'Rp.10.000', 'hargaJual': 'Rp.10.000'},
//     {'name': 'Minyak', 'stock': '100', 'hargaBeli': 'Rp.10.000', 'hargaJual': 'Rp.10.000'},
//     // Add more items as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('List Barang'),
//           backgroundColor: Color(0xFFc42e1d),
//         ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.all(8.0),
//                   padding: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: Color(0xFFc42e1d),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: itemList.length,
//                     itemBuilder: (context, index) {
//                       return buildListItem(
//                         itemList[index]['name'],
//                         itemList[index]['stock'],
//                         itemList[index]['hargaBeli'],
//                         itemList[index]['hargaJual'],
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => FormPage()),
//             );
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }

//   Widget buildListItem(String name, String stock, String hargaBeli, String hargaJual) {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 0,
//             color: Colors.grey,
//             offset: Offset(0, 1),
//           ),
//         ],
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(
//               child: Text(
//                 name ?? '',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 stock ?? '',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 hargaBeli ?? '',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 hargaJual ?? '',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const ListBarangWidget());
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'form.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const ListBarangWidget());
// }

// class ListBarangWidget extends StatelessWidget {
//   const ListBarangWidget({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('List Barang'),
//           backgroundColor: Color(0xFFc42e1d),
//         ),
//         body: SafeArea(
//           child: StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection('produk').snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
//                 return Text('No items found.');
//               } else {
//                 List<Map<String, String>> itemList = snapshot.data.docs
//                     .map((doc) => Map<String, String>.from(doc.data() as Map))
//                     .toList();
//                 return Container(
//                   margin: EdgeInsets.all(8.0),
//                   padding: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: Color(0xFFc42e1d),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: itemList.length,
//                     itemBuilder: (context, index) {
//                       return buildListItem(
//                         itemList[index]['name'],
//                         itemList[index]['stock'],
//                         itemList[index]['hargaBeli'],
//                         itemList[index]['hargaJual'],
//                       );
//                     },
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             await Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => FormPage()),
//             );
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }

//   Widget buildListItem(String name, String stock, String hargaBeli, String hargaJual) {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 0,
//             color: Colors.grey,
//             offset: Offset(0, 1),
//           ),
//         ],
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(
//               child: Text(
//                 name ?? '',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 stock ?? '',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 hargaBeli ?? '',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 hargaJual ?? '',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'form.dart';

// class ListBarangWidget extends StatefulWidget {
//   @override
//   _ListBarangWidgetState createState() => _ListBarangWidgetState();
// }

// class _ListBarangWidgetState extends State<ListBarangWidget> {
//   Future<List<DocumentSnapshot>> getData() async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('produk').get();
//     return querySnapshot.docs;
//   }

//   Widget buildListItem(String name, String stock, String hargaBeli, String hargaJual) {
//     return Container(
//       margin: EdgeInsets.all(8.0),
//       padding: EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         color: Color(0xFFc42e1d),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Name: $name',
//             style: TextStyle(color: Colors.white),
//           ),
//           Text(
//             'Stock: $stock',
//             style: TextStyle(color: Colors.white),
//           ),
//           Text(
//             'Harga Beli: $hargaBeli',
//             style: TextStyle(color: Colors.white),
//           ),
//           Text(
//             'Harga Jual: $hargaJual',
//             style: TextStyle(color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Barang'),
//         backgroundColor: Color(0xFFc42e1d),
//       ),
//       body: FutureBuilder(
//         future: getData(),
//         builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator(); // Loading indicator while data is being fetched
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             List<DocumentSnapshot> data = snapshot.data;
//             return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 Map<String, dynamic> productData = data[index].data() as Map<String, dynamic>;
//                 return buildListItem(
//                   productData['nama_produk'],
//                   productData['stok'],
//                   productData['harga_beli'],
//                   productData['harga_jual'],
//                 );
//               },
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => FormPage()),
//           );
//         },
//         child: Icon(Icons.add),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'form.dart';

class ListBarangWidget extends StatefulWidget {
  @override
  _ListBarangWidgetState createState() => _ListBarangWidgetState();
}

class _ListBarangWidgetState extends State<ListBarangWidget> {
  Future<List<DocumentSnapshot>> getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('produk').get();
    return querySnapshot.docs;
  }

  Widget buildListItem(String name, String stock, String hargaBeli, String hargaJual, String diskon, Timestamp masaBerlakuDiskon) {
    String formattedExpiryDate = 'Tidak Ada Masa Berlaku Diskon'; // Default jika tidak ada masa berlaku diskon

    if (masaBerlakuDiskon != null) {
      DateTime expiryDate = masaBerlakuDiskon.toDate();
      formattedExpiryDate = expiryDate.toString().substring(0,10); // Mengambil bagian tanggal dari Timestamp
    }

    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xFFc42e1d),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name: $name',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Stock: $stock',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Harga Beli: $hargaBeli',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Harga Jual: $hargaJual',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Diskon: $diskon%',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Masa Berlaku Diskon: $formattedExpiryDate',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Barang'),
        backgroundColor: Color(0xFFc42e1d),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), // Loading indicator while data is being fetched
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<DocumentSnapshot> data = snapshot.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> productData = data[index].data() as Map<String, dynamic>;
                String diskon = productData['diskon'].toString();
                Timestamp masaBerlakuDiskon = productData['masa_berlaku_diskon'];

                return buildListItem(
                  productData['nama_produk'],
                  productData['stok'],
                  productData['harga_beli'],
                  productData['harga_jual'],
                  diskon,
                  masaBerlakuDiskon,
                );
              },
            );
          }
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
}

void main() {
  runApp(MaterialApp(
    home: ListBarangWidget(),
  ));
}
