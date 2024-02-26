// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() {
//   runApp(TransaksiDetailWidget1());
// }

// class TransaksiDetailWidget1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Cart(),
//       child: MaterialApp(
//         title: 'Shopping App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: HomePage(),
//         routes: {
//           '/cart': (context) => CartPage(),
//           '/checkout': (context) => CheckoutPage(),
//         },
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Items'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart');
//             },
//           ),
//         ],
//       ),
//       body: CustomerForm(),
//     );
//   }
// }

// // class ItemList extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder(
// //       stream: FirebaseFirestore.instance.collection('produk').snapshots(),
// //       builder: (context, snapshot) {
// //         if (!snapshot.hasData) {
// //           return CircularProgressIndicator();
// //         }
// //         return ListView.builder(
// //           itemCount: snapshot.data.docs.length,
// //           itemBuilder: (context, index) {
// //             DocumentSnapshot item = snapshot.data.docs[index];
// //             return ListTile(
// //               title: Text(item['nama_produk']),
// //               subtitle: Text('\$${item['harga_jual']}'),
// //               trailing: IconButton(
// //                 icon: Icon(Icons.add),
// //                 onPressed: () {
// //                   Provider.of<Cart>(context, listen: false).addItem(item);
// //                 },
// //               ),
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }
// // }

// class CustomerForm extends StatefulWidget {
//   @override
//   _CustomerFormState createState() => _CustomerFormState();
// }

// class _CustomerFormState extends State<CustomerForm> {
//   final TextEditingController _nameController = TextEditingController();
//   String _selectedCustomerId;
//   List<Map<String, dynamic>> _customers = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadCustomers();
//   }

//   Future<void> _loadCustomers() async {
//     QuerySnapshot querySnapshot =
//         await FirebaseFirestore.instance.collection('pelanggan').get();
//     setState(() {
//       _customers = querySnapshot.docs
//           .map((doc) => {"nama_pelanggan": doc.id, ...doc.data()})
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // TextField(
//             //   controller: _nameController,
//             //   decoration: InputDecoration(labelText: 'Customer Name'),
//             // ),
//             SizedBox(height: 16.0),
//             DropdownButtonFormField(
//               value: _selectedCustomerId,
//               items: _customers.map((customer) {
//                 return DropdownMenuItem(
//                   value: customer['nama_pelanggan'],
//                   child: Text(customer['nama_pelanggan']),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   _selectedCustomerId = value;
//                 });
//               },
//               decoration: InputDecoration(labelText: 'Select Customer'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Simpan data ke Firebase atau lakukan operasi lainnya
//                 _saveData();
//               },
//               child: Text('Save'),
//             ),
//             // Product List
//             Expanded(
//               child: StreamBuilder(
//                 stream:
//                     FirebaseFirestore.instance.collection('produk').snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return CircularProgressIndicator();
//                   }
//                   return ListView.builder(
//                     itemCount: snapshot.data.docs.length,
//                     itemBuilder: (context, index) {
//                       DocumentSnapshot item = snapshot.data.docs[index];
//                       Map<String, dynamic> data =
//                           item.data() as Map<String, dynamic>;
//                       return ListTile(
//                         title: Text(item['nama_produk']),
//                         subtitle: Text('\$${item['harga_jual']}'),
//                         trailing: IconButton(
//                           icon: Icon(Icons.add),
//                           onPressed: () {
//                             // Use selectedCustomer as needed in your application
//                             // String customerName = selectedCustomer;
//                             // Add logic to save data to Firestore or elsewhere
//                             // ...

//                             // Provider.of<Cart>(context, listen: false)
//                             //     .addItem(item);
//                           },
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _saveData() {
//     String customerName = _nameController.text.trim();

//     // Lakukan validasi atau operasi lainnya jika diperlukan

//     // Simpan data ke Firebase
//     FirebaseFirestore.instance.collection('orders').add({
//       'customer_id': _selectedCustomerId,
//       'customer_name': customerName,
//       // Tambahkan field lainnya sesuai kebutuhan
//     }).then((value) {
//       // Reset form atau lakukan operasi setelah penyimpanan berhasil
//       _nameController.clear();
//       setState(() {
//         _selectedCustomerId = null;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Data saved successfully'),
//       ));
//     }).catchError((error) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to save data. Error: $error'),
//       ));
//     });
//   }
// }

// class ItemList extends StatefulWidget {
//   @override
//   _ItemListState createState() => _ItemListState();
// }

// class _ItemListState extends State<ItemList> {
//   String selectedCustomer = ''; // To store the selected value from the dropdown

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         // Dropdown for Customer Names
//         Padding(
//           padding: EdgeInsets.all(8.0),
//           child: StreamBuilder(
//             stream: FirebaseFirestore.instance.collection('cus').snapshots(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return CircularProgressIndicator();
//               }
//               List<String> customerNames = List<String>.from(
//                   snapshot.data.docs.map((doc) => doc['nama_pelanggan']));

//               return DropdownButton(
//                 value: selectedCustomer,
//                 items: customerNames.map((String customer) {
//                   return DropdownMenuItem(
//                     value: customer,
//                     child: Text(customer),
//                   );
//                 }).toList(),
//                 hint: Text('Select Customer Name'),
//               );
//             },
//           ),
//         ),

//         // Product List
//         // Expanded(
//         //   child: StreamBuilder(
//         //     stream: FirebaseFirestore.instance.collection('produk').snapshots(),
//         //     builder: (context, snapshot) {
//         //       if (!snapshot.hasData) {
//         //         return CircularProgressIndicator();
//         //       }
//         //       return ListView.builder(
//         //         itemCount: snapshot.data.docs.length,
//         //         itemBuilder: (context, index) {
//         //           DocumentSnapshot item = snapshot.data.docs[index];
//         //           Map<String, dynamic> data =
//         //               item.data() as Map<String, dynamic>;
//         //           return ListTile(
//         //             title: Text(item['nama_produk']),
//         //             subtitle: Text('\$${item['harga_jual']}'),
//         //             trailing: IconButton(
//         //               icon: Icon(Icons.add),
//         //               onPressed: () {
//         //                 // Use selectedCustomer as needed in your application
//         //                 String customerName = selectedCustomer;
//         //                 // Add logic to save data to Firestore or elsewhere
//         //                 // ...

//         //                 Provider.of<Cart>(context, listen: false).addItem(item);
//         //               },
//         //             ),
//         //           );
//         //         },
//         //       );
//         //     },
//         //   ),
//         // ),
//       ],
//     );
//   }
// }

// class Cart extends ChangeNotifier {
//   List<Map<String, dynamic>> _items = [];

//   List<Map<String, dynamic>> get items => _items;

//   void addItem(DocumentSnapshot item) {
//     bool found = false;
//     for (var cartItem in _items) {
//       if (cartItem['id'] == item.id) {
//         cartItem['qty'] += 1;
//         found = true;
//         break;
//       }
//     }
//     if (!found) {
//       _items.add({
//         'id': item.id,
//         'nama_produk': item['nama_produk'],
//         'harga_jual': item['harga_jual'],
//         'qty': 1,
//       });
//     }
//     notifyListeners();
//   }

//   void removeItem(int index) {
//     _items.removeAt(index);
//     notifyListeners();
//   }

//   void clearCart() {
//     for (var item in _items) {
//       _removeItemFromFirestore(item['id']);
//     }
//     _items.clear();
//     notifyListeners();
//   }

//   Future<void> _removeItemFromFirestore(String itemId) async {
//     await FirebaseFirestore.instance
//         .collection('keranjang')
//         .doc(itemId)
//         .delete();
//   }
// }

// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   void initState() {
//     super.initState();
//     _saveCartItemsToFirestore();
//   }

//   Future<void> _saveCartItemsToFirestore() async {
//     final cart = Provider.of<Cart>(context, listen: false);
//     for (var item in cart.items) {
//       await FirebaseFirestore.instance.collection('keranjang').add({
//         'id': item['id'],
//         'nama_produk': item['nama_produk'],
//         'harga_jual': item['harga_jual'],
//         'qty': item['qty'],
//       });
//     }
//   }

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
//           final item = cart.items[index];
//           return ListTile(
//             title: Text(item['nama_produk']),
//             subtitle: Row(
//               children: [
//                 Text('\$${item['harga_jual']}'),
//                 SizedBox(width: 10),
//                 Text('Qty: ${item['qty']}'),
//               ],
//             ),
//             trailing: IconButton(
//               icon: Icon(Icons.remove),
//               onPressed: () {
//                 Provider.of<Cart>(context, listen: false).removeItem(index);
//               },
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/checkout');
//                 },
//                 child: Text('Proceed to Checkout'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Provider.of<Cart>(context, listen: false).clearCart();
//                 },
//                 child: Text('Clear Cart'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CheckoutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);

//     double totalAmount = cart.items.fold(0, (sum, item) {
//       double hargaJual = item['harga_jual'] is String
//           ? double.tryParse(item['harga_jual']) ?? 0
//           : (item['harga_jual'] ?? 0).toDouble();
//       return sum + (item['qty'] * hargaJual);
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//       ),
//       body: Column(
//         children: [
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: cart.items.length,
//             itemBuilder: (context, index) {
//               final item = cart.items[index];
//               return ListTile(
//                 title: Text(item['nama_produk']),
//                 subtitle: Row(
//                   children: [
//                     Text('\$${item['harga_jual']}'),
//                     SizedBox(width: 10),
//                     Text('Qty: ${item['qty']}'),
//                   ],
//                 ),
//               );
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Provider.of<Cart>(context, listen: false).clearCart();
//               Navigator.pop(context);
//             },
//             child: Text('Complete Purchase'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// kode seng bener!!!!!
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() {
//   runApp(TransaksiDetailWidget1());
// }

// class TransaksiDetailWidget1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Cart(),
//       child: MaterialApp(
//         title: 'Shopping App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: HomePage(),
//         routes: {
//           '/cart': (context) => CartPage(),
//           '/checkout': (context) => CheckoutPage(),
//         },
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Items'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart');
//             },
//           ),
//         ],
//       ),
//       body: CustomerForm(),
//     );
//   }
// }

// class CustomerForm extends StatefulWidget {
//   @override
//   _CustomerFormState createState() => _CustomerFormState();
// }

// class _CustomerFormState extends State<CustomerForm> {
//   final TextEditingController _nameController = TextEditingController();
//   String _selectedCustomerId;
//   List<Map<String, dynamic>> _customers = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadCustomers();
//   }

//   Future<void> _loadCustomers() async {
//     QuerySnapshot querySnapshot =
//         await FirebaseFirestore.instance.collection('pelanggan').get();
//     setState(() {
//       _customers = querySnapshot.docs
//           .map((doc) => {"nama_pelanggan": doc.id, ...doc.data()})
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 16.0),
//             DropdownButtonFormField(
//               value: _selectedCustomerId,
//               items: _customers.map((customer) {
//                 return DropdownMenuItem(
//                   value: customer['nama_pelanggan'],
//                   child: Text(customer['nama_pelanggan']),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   _selectedCustomerId = value;
//                 });
//               },
//               decoration: InputDecoration(labelText: 'Select Customer'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 _saveData();
//               },
//               child: Text('Save'),
//             ),
//             Expanded(
//               child: StreamBuilder(
//                 stream:
//                     FirebaseFirestore.instance.collection('produk').snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return CircularProgressIndicator();
//                   }
//                   return ListView.builder(
//                     itemCount: snapshot.data.docs.length,
//                     itemBuilder: (context, index) {
//                       DocumentSnapshot item = snapshot.data.docs[index];
//                       Map<String, dynamic> data =
//                           item.data() as Map<String, dynamic>;
//                       return ListTile(
//                         title: Text(item['nama_produk']),
//                         subtitle: Text('\$${item['harga_jual']}'),
//                         trailing: IconButton(
//                           icon: Icon(Icons.add),
//                           onPressed: () {
//                             Provider.of<Cart>(context, listen: false)
//                                 .addItem(item);
//                           },
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _saveData() {
//     FirebaseFirestore.instance.collection('header_transaksi').add({
//       'id_pelanggan': _selectedCustomerId,
//       'tanggal_transaksi': Timestamp.now(),
//     }).then((value) {
//       final String headerTransaksiId = value.id;
//       var cart;
//       for (var item in cart.items) {
//         FirebaseFirestore.instance.collection('detail_transaksi').add({
//           'id_header_transaksi': headerTransaksiId,
//           'id_produk': item['id'],
//           'qty': item['qty'],
//         });
//       }
//       cart.clearCart(); // Bersihkan keranjang setelah selesai checkout
//       Navigator.pop(context); // Kembali ke halaman sebelumnya
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Transaction completed successfully'),
//       ));
//     }).catchError((error) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to complete transaction. Error: $error'),
//       ));
//     });
//   }
// }

// class Cart extends ChangeNotifier {
//   List<Map<String, dynamic>> _items = [];

//   List<Map<String, dynamic>> get items => _items;

//   void addItem(DocumentSnapshot item) {
//     bool found = false;
//     for (var cartItem in _items) {
//       if (cartItem['id'] == item.id) {
//         cartItem['qty'] += 1;
//         found = true;
//         break;
//       }
//     }
//     if (!found) {
//       _items.add({
//         'id': item.id,
//         'nama_produk': item['nama_produk'],
//         'harga_jual': item['harga_jual'],
//         'qty': 1,
//       });
//     }
//     notifyListeners();
//   }

//   void removeItem(int index) {
//     _items.removeAt(index);
//     notifyListeners();
//   }

//   void clearCart() {
//     _items.clear();
//     notifyListeners();
//   }
// }

// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
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
//           final item = cart.items[index];
//           return ListTile(
//             title: Text(item['nama_produk']),
//             subtitle: Row(
//               children: [
//                 Text('\$${item['harga_jual']}'),
//                 SizedBox(width: 10),
//                 Text('Qty: ${item['qty']}'),
//               ],
//             ),
//             trailing: IconButton(
//               icon: Icon(Icons.remove),
//               onPressed: () {
//                 Provider.of<Cart>(context, listen: false).removeItem(index);
//               },
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/checkout');
//                 },
//                 child: Text('Proceed to Checkout'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Provider.of<Cart>(context, listen: false).clearCart();
//                 },
//                 child: Text('Clear Cart'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CheckoutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);

//     double totalAmount = cart.items.fold(0, (sum, item) {
//       double hargaJual = item['harga_jual'] is String
//           ? double.tryParse(item['harga_jual']) ?? 0
//           : (item['harga_jual'] ?? 0).toDouble();
//       return sum + (item['qty'] * hargaJual);
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//       ),
//       body: Column(
//         children: [
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: cart.items.length,
//             itemBuilder: (context, index) {
//               final item = cart.items[index];
//               return ListTile(
//                 title: Text(item['nama_produk']),
//                 subtitle: Row(
//                   children: [
//                     Text('\$${item['harga_jual']}'),
//                     SizedBox(width: 10),
//                     Text('Qty: ${item['qty']}'),
//                   ],
//                 ),
//               );
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               _saveData(cart, totalAmount, context);
//             },
//             child: Text('Complete Purchase'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _saveData(Cart cart, double totalAmount, BuildContext context) {
//     FirebaseFirestore.instance.collection('header_transaksi').add({
//       'total_harga': totalAmount,
//       'tanggal_transaksi': Timestamp.now(),
//     }).then((value) {
//       final String headerTransaksiId = value.id;
//       for (var item in cart.items) {
//         FirebaseFirestore.instance.collection('detail_transaksi').add({
//           'id_header_transaksi': headerTransaksiId,
//           'id_produk': item['id'],
//           'qty': item['qty'],
//         });
//       }
//       cart.clearCart(); // Bersihkan keranjang setelah selesai checkout
//       Navigator.pop(context); // Kembali ke halaman sebelumnya
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Transaction completed successfully'),
//       ));
//     }).catchError((error) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Failed to complete transaction. Error: $error'),
//       ));
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'detail_transaksi_1.dart';

void main() {
  runApp(TransaksiDetailWidget1());
}

class TransaksiDetailWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {
          // '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/detail_transaksi': (context) => DetailTransaksi(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomerForm(),
    );
  }
}

class CustomerForm extends StatefulWidget {
  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedCustomerId;
  List<Map<String, dynamic>> _customers = [];

  @override
  void initState() {
    super.initState();
    _loadCustomers();
  }

  Future<void> _loadCustomers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('pelanggan').get();
    setState(() {
      _customers = querySnapshot.docs
          .map((doc) => {"nama_pelanggan": doc.id, ...doc.data()})
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            // DropdownButtonFormField(
            //   value: _selectedCustomerId,
            //   items: _customers.map((customer) {
            //     return DropdownMenuItem(
            //       value: customer['nama_pelanggan'],
            //       child: Text(customer['nama_pelanggan']),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       _selectedCustomerId = value;
            //     });
            //   },
            //   decoration: InputDecoration(labelText: 'Select Customer'),
            // ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    // color: Colors.red, // Atur warna ikon menjadi merah
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    value: _selectedCustomerId,
                    items: _customers.map((customer) {
                      return DropdownMenuItem(
                        value: customer['nama_pelanggan'],
                        child: Text(customer['nama_pelanggan']),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCustomerId = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Customer',
                      labelStyle: TextStyle(
                        color:
                            Colors.black, // Mengatur warna label menjadi merah
                      ),
                      // Atau, jika ingin mengubah warna underline
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _saveData();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors
                    .red, // Atur warna latar belakang tombol menjadi merah
              ),
              child: Text('Save'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('produk').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width:
                            50.0, // Sesuaikan ukuran progres sesuai kebutuhan Anda
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                          strokeWidth:
                              3.0, // Sesuaikan ketebalan garis sesuai kebutuhan Anda
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot item = snapshot.data.docs[index];
                      Map<String, dynamic> data =
                          item.data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(item['nama_produk']),
                        subtitle: Text('\$${item['harga_jual']}'),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .addItem(item);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveData() {
    FirebaseFirestore.instance.collection('header_transaksi').add({
      'id_customer': _selectedCustomerId,
      'tanggal_transaksi': Timestamp.now(),
      'total_harga': Provider.of<Cart>(context, listen: false).totalAmount,
    }).then((value) {
      final String headerTransaksiId = value.id;
      var cart = Provider.of<Cart>(context, listen: false);
      for (var item in cart.items) {
        FirebaseFirestore.instance.collection('detail_transaksi').add({
          'id_header_transaksi': headerTransaksiId,
          'id_produk': item['id'],
          'qty': item['qty'],
        });
      }
      cart.clearCart(); // Bersihkan keranjang setelah selesai checkout
      // Navigator.pop(context); // Kembali ke halaman sebelumnya
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Transaction completed successfully'),
      ));
      Navigator.pushReplacementNamed(context, '/detail_transaksi');
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to complete transaction. Error: $error'),
      ));
    });
  }
}

class Cart extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  double get totalAmount {
    return _items.fold(0, (sum, item) {
      double hargaJual = item['harga_jual'] is String
          ? double.tryParse(item['harga_jual']) ?? 0
          : (item['harga_jual'] ?? 0).toDouble();
      return sum + (item['qty'] * hargaJual);
    });
  }

  void addItem(DocumentSnapshot item) {
    bool found = false;
    for (var cartItem in _items) {
      if (cartItem['id'] == item.id) {
        cartItem['qty'] += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      _items.add({
        'id': item.id,
        'nama_produk': item['nama_produk'],
        'harga_jual': item['harga_jual'],
        'qty': 1,
      });
    }
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Ikon kembali
          onPressed: () {
            Navigator.pop(context); // Fungsi untuk kembali
          },
        ),
        title: Text('Shopping Cart'), // Judul AppBar
        backgroundColor: Colors.red, // Warna latar belakang AppBar
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item['nama_produk']),
            subtitle: Row(
              children: [
                Text('\$${item['harga_jual']}'),
                SizedBox(width: 10),
                Text('Qty: ${item['qty']}'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                Provider.of<Cart>(context, listen: false).removeItem(index);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              primary: Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text('Clear Cart'),
            ),
            onPressed: () {
              Provider.of<Cart>(context, listen: false).clearCart();
            },
          ),
        ),

        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/checkout');
        //   },
        //   child: Text('Proceed to Checkout'),
        // ),

        // ElevatedButton(
        //   onPressed: () {
        //     Provider.of<Cart>(context, listen: false).clearCart();
        //   },
        //   child: Text('Clear Cart'),
        // ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return ListTile(
                title: Text(item['nama_produk']),
                subtitle: Row(
                  children: [
                    Text('\$${item['harga_jual']}'),
                    SizedBox(width: 10),
                    Text('Qty: ${item['qty']}'),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text('Total Amount: \$${cart.totalAmount.toStringAsFixed(2)}'),
          ),
          ElevatedButton(
            onPressed: () {
              _saveData(cart.totalAmount, context);
            },
            child: Text('Complete Purchase'),
          ),
        ],
      ),
    );
  }

  void _saveData(double totalAmount, BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    FirebaseFirestore.instance.collection('header_transaksi').add({
      'id_customer': cart.items.isNotEmpty ? cart.items.first['id'] : null,
      'tanggal_transaksi': Timestamp.now(),
      'total_harga': totalAmount,
    }).then((value) {
      final String headerTransaksiId = value.id;
      for (var item in cart.items) {
        FirebaseFirestore.instance.collection('detail_transaksi').add({
          'id_header_transaksi': headerTransaksiId,
          'id_produk': item['id'],
          'qty': item['qty'],
        });
      }
      cart.clearCart(); // Bersihkan keranjang setelah selesai checkout
      // Navigator.pop(context); // Kembali ke halaman sebelumnya
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Transaction completed successfully')),
      // );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/detail_transaksi1');
      });
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Failed to complete transaction. Error: $error')),
      );
    });
  }
}

// class DetailTransaksi extends StatelessWidget {
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
//         title: Text('Detail Transaksi'),
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
//                           SizedBox(width: 60),
//                         ],
//                       ),
//                     ),
//                     // Menampilkan data dari koleksi detail_transaksi
//                     StreamBuilder(
//                       stream: FirebaseFirestore.instance
//                           .collection('detail_transaksi')
//                           .snapshots(),
//                       builder: (context, snapshot) {
//                         if (!snapshot.hasData) {
//                           return CircularProgressIndicator();
//                         }
//                         // Menampilkan data dalam bentuk list
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: snapshot.data.docs.map<Widget>((document) {
//                             return FutureBuilder(
//                               future: _getProductName(document['id_produk']),
//                               builder: (context, productSnapshot) {
//                                 if (productSnapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return CircularProgressIndicator();
//                                 }
//                                 String productName =
//                                     productSnapshot.data ?? 'Unknown Product';
//                                 return _buildProductRow(
//                                   productName,
//                                   document['qty'],
//                                   context,
//                                 );
//                               },
//                             );
//                           }).toList(),
//                         );
//                       },
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

//   // Mendapatkan nama produk berdasarkan id_produk
//   Future<String> _getProductName(String productId) async {
//     DocumentSnapshot productSnapshot = await FirebaseFirestore.instance
//         .collection('produk')
//         .doc(productId)
//         .get();
//     return productSnapshot['nama_produk'];
//   }

//   Widget _buildProductRow(
//       String productName, int quantity, BuildContext context) {
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
//             quantity.toString(),
//             style: Theme.of(context).textTheme.bodyText1,
//           ),
//         ],
//       ),
//     );
//   }
// }

class DetailTransaksi extends StatelessWidget {
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
        title: Text('Detail Transaksi'),
        backgroundColor: Colors.red,
      ),
      body: Center(
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
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 60),
                          Text('Qty',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 60),
                        ],
                      ),
                    ),
                    // Menampilkan data dari koleksi detail_transaksi
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('detail_transaksi')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width:
                                  50.0, // Sesuaikan ukuran progres sesuai kebutuhan Anda
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.red),
                                strokeWidth:
                                    3.0, // Sesuaikan ketebalan garis sesuai kebutuhan Anda
                              ),
                            ),
                          );
                        }
                        // Menampilkan data dalam bentuk list
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: snapshot.data.docs.map<Widget>((document) {
                            return FutureBuilder(
                              future: _getProductName(document['id_produk']),
                              builder: (context, productSnapshot) {
                                if (productSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                String productName =
                                    productSnapshot.data ?? 'Unknown Product';
                                return _buildProductRow(
                                  productName,
                                  document['qty'],
                                  context,
                                );
                              },
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Mendapatkan nama produk berdasarkan id_produk
  Future<String> _getProductName(String productId) async {
    DocumentSnapshot productSnapshot = await FirebaseFirestore.instance
        .collection('produk')
        .doc(productId)
        .get();
    return productSnapshot['nama_produk'];
  }

  Widget _buildProductRow(
      String productName, int quantity, BuildContext context) {
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
            quantity.toString(),
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
