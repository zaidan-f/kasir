// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'transaksi.dart';

// class CartPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: cart.items.length,
//         itemBuilder: (context, index) {
//           Map<String, dynamic> item = cart.items[index];
//           return ListTile(
//             title: Text(item['nama_produk']),
//             subtitle: Text('\$${item['harga_jual']}'),
//             trailing: IconButton(
//               icon: Icon(Icons.remove),
//               onPressed: () {
//                 Provider.of<Cart>(context, listen: false).removeItem(index);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

