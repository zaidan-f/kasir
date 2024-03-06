import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'home_roma.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:async';

// void main() {
//   runApp(TransaksiDetailWidget1());
// }

// class TransaksiDetailWidget1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TransaksiDetailWidget2(),
//     );
//   }
// }

// class TransaksiDetailWidget2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Cart(),
//       child: MaterialApp(
//         title: 'kasir',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: HomePage(),
//         routes: {
//           '/detail_transaksi1': (context) => HalamanDetailTransaksi(),
//         },
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ChangeNotifierProvider(
//         create: (context) => Cart(),
//         child: CustomerForm(),
//       ),
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
//   String _selectedCustomerName;
//   List<Map<String, dynamic>> _customers = [];
//   bool _isCustomerSelected = false;

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
//     final cart = Provider.of<Cart>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: Text('Transaksi'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 16.0),
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(right: 5.0),
//                   child: IconButton(
//                     icon: Icon(Icons.shopping_cart),
//                     onPressed: _isCustomerSelected
//                         ? () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => CartPage(
//                                   customerName: _selectedCustomerName,
//                                   cartItems: cart.items,
//                                 ),
//                               ),
//                             );
//                           }
//                         : null,
//                   ),
//                 ),
//                 Expanded(
//                   child: DropdownButtonFormField(
//                     value: _selectedCustomerId,
//                     items: _customers.map((customer) {
//                       return DropdownMenuItem(
//                         value: customer['nama_pelanggan'],
//                         child: Text(customer['nama_pelanggan']),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedCustomerId = value;
//                         _selectedCustomerName = value;
//                         _isCustomerSelected = true;
//                       });
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Pilih Pelanggan',
//                       labelStyle: TextStyle(
//                         color: Colors.black,
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 if (_selectedCustomerId == null) {
//                   _showNotification('Please select a customer.');
//                 } else if (cart.items.isEmpty) {
//                   _showNotification('Cart is empty. Add items to the cart.');
//                 } else {
//                   _saveData(cart.totalAmount, context);
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.red,
//               ),
//               child: Text('Save'),
//             ),
//             SizedBox(height: 9.0),
//             Text(
//               'Produk Terpilih: ${cart.items.length}',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 5.0),
//             Expanded(
//               child: StreamBuilder(
//                 stream: FirebaseFirestore.instance.collection('produk').snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: SizedBox(
//                         width: 50.0,
//                         height: 50.0,
//                         child: CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                           strokeWidth: 3.0,
//                         ),
//                       ),
//                     );
//                   }
//                   return ListView.builder(
//                     itemCount: snapshot.data.docs.length,
//                     itemBuilder: (context, index) {
//                       DocumentSnapshot item = snapshot.data.docs[index];
//                       Map<String, dynamic> data = item.data() as Map<String, dynamic>;

//                       double hargaJual = (data['harga_jual'] ?? 0.0) as double;
//                       bool isDiscountValid = _isDiscountValidForProduct(data);
//                       double diskon = (data['diskon'] ?? 0.0) as double;

//                       String discountInfo = isDiscountValid
//                           ? 'Diskon ${diskon}% berlaku'
//                           : 'Tidak ada diskon';

//                       if (isDiscountValid) {
//                         hargaJual = hargaJual - diskon;
//                       }

//                       return ListTile(
//                         title: Text(
//                           item['nama_produk'],
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: isDiscountValid
//                             ? RichText(
//                                 text: TextSpan(
//                                   text: '\Rp $hargaJual, ',
//                                   style: DefaultTextStyle.of(context).style,
//                                   children: <TextSpan>[],
//                                 ),
//                               )
//                             : Text(
//                                 '\Rp $hargaJual',
//                               ),
//                         trailing: IconButton(
//                           icon: Icon(Icons.add),
//                           onPressed: () {
//                             Provider.of<Cart>(context, listen: false).addItem(item);
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

//   void _showNotification(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }

//   Future<void> _saveData(double totalAmount, BuildContext context) async {
//     final cart = Provider.of<Cart>(context, listen: false);
//     User user = FirebaseAuth.instance.currentUser;

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Image.asset('assets/qr/QR bayar.jpeg'),
//         );
//       },
//     );

//     Future.delayed(Duration(seconds: 15), () {
//       FirebaseFirestore.instance.collection('header_transaksi').add({
//         'id_customer': cart.items.isNotEmpty ? cart.items.first['id'] : null,
//         'tanggal_transaksi': Timestamp.now(),
//         'total_harga': totalAmount,
//         'id_kasir': user.uid,
//       }).then((headerTransaksiDoc) async {
//         final String headerTransaksiId = headerTransaksiDoc.id;

//         for (var item in cart.items) {
//           await FirebaseFirestore.instance
//               .collection('produk')
//               .doc(item['id'])
//               .update({
//             'stok': FieldValue.increment(-item['qty']),
//           });

//           FirebaseFirestore.instance.collection('detail_transaksi').add({
//             'id_header_transaksi': headerTransaksiId,
//             'id_produk': item['id'],
//             'qty': item['qty'],
//             'harga_jual': item['harga_jual'],
//             'harga_beli': item['harga_beli'],
//           });
//         }

//         cart.clearCart();

//         Navigator.pushReplacementNamed(
//           context,
//           '/detail_transaksi1',
//           arguments: {'headerTransaksiId': headerTransaksiId},
//         );
//       }).catchError((error) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to complete the transaction. Error: $error'),
//           ),
//         );
//       });
//     });
//   }

//   bool _isDiscountValidForProduct(Map<String, dynamic> productData) {
//     double discount = productData['diskon'] ?? 0.0;
//     Timestamp expirationDate = productData['expiration_date'];
//     Timestamp activeDiscountDate = productData['active_discount_date'];

//     DateTime expirationDateTime = expirationDate?.toDate() ?? DateTime.now();
//     DateTime activeDiscountDateTime =
//         activeDiscountDate?.toDate() ?? DateTime.now();

//     Timestamp currentDate = Timestamp.now();

//     bool isDiscountValid = currentDate.toDate().isBefore(expirationDateTime) &&
//         currentDate.toDate().isAfter(activeDiscountDateTime);

//     return isDiscountValid;
//   }
// }

// class Cart extends ChangeNotifier {
//   List<Map<String, dynamic>> _items = [];

//   List<Map<String, dynamic>> get items => _items;

//   bool _isDiscountValidForProduct(Map<String, dynamic> productData) {
//     double discount = productData['diskon'] ?? 0.0;
//     Timestamp expirationDate = productData['expiration_date'];
//     Timestamp activeDiscountDate = productData['active_discount_date'];

//     DateTime expirationDateTime = expirationDate?.toDate() ?? DateTime.now();
//     DateTime activeDiscountDateTime =
//         activeDiscountDate?.toDate() ?? DateTime.now();

//     Timestamp currentDate = Timestamp.now();

//     bool isDiscountValid = currentDate.toDate().isBefore(expirationDateTime) &&
//         currentDate.toDate().isAfter(activeDiscountDateTime);

//     return isDiscountValid;
//   }

//   void addItem(DocumentSnapshot item) {
//     bool isDiscountValid = _isDiscountValidForProduct(item.data());
//     double hargaJual = (item['harga_jual'] ?? 0.0) as double;
//     double diskon = (item['diskon'] ?? 0.0) as double;

//     _items.add({
//       'id': item.id,
//       'nama_produk': item['nama_produk'],
//       'harga_jual': hargaJual,
//       'diskon': diskon,
//       'qty': 1,
//       'isDiscountValid': isDiscountValid,
//     });

//     notifyListeners();
//   }

//   double get totalAmount {
//     return _items.fold(0, (sum, item) {
//       double hargaJual = item['harga_jual'] is String
//           ? double.tryParse(item['harga_jual']) ?? 0
//           : (item['harga_jual'] ?? 0).toDouble();
//       return sum + (item['qty'] * hargaJual);
//     });
//   }

//   void removeItem(int index) {
//     _items.removeAt(index);
//     notifyListeners();
//   }

//   void clearCart() {
//     _items.clear();
//     notifyListeners();
//   }

//   void updateQuantity(int index, int newQuantity) {
//     _items[index]['qty'] = newQuantity;
//     notifyListeners();
//   }
// }

// class CartPage extends StatefulWidget {
//   final String customerName;
//   final List<Map<String, dynamic>> cartItems;
//   CartPage({@required this.customerName, @required this.cartItems});

//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text('Shopping Cart'),
//         backgroundColor: Colors.red,
//       ),
//       body: ListView.builder(
//         itemCount: cart.items.length,
//         itemBuilder: (context, index) {
//           final item = cart.items[index];
//           return ListTile(
//             title: Text(item['nama_produk']),
//             subtitle: Row(
//               children: [
//                 Text('\Rp.${item['harga_jual']}'),
//                 SizedBox(width: 10),
//                 Text('Qty: ${item['qty']}'),
//               ],
//             ),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.delete),
//                   color: Colors.red,
//                   onPressed: () {
//                     Provider.of<Cart>(context, listen: false).removeItem(index);
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               color: Colors.grey[300],
//               padding: EdgeInsets.all(10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Total: Rp.${cart.totalAmount.toStringAsFixed(2)}',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               title: Text('Nama Pelanggan'),
//               subtitle: Text('${widget.customerName}'),
//             ),
//             Divider(),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 90),
//                       primary: Colors.red,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       child: Text('Clear Cart'),
//                     ),
//                     onPressed: () {
//                       Provider.of<Cart>(context, listen: false).clearCart();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HalamanDetailTransaksi extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map args = ModalRoute.of(context).settings.arguments;
//     final String headerTransaksiId = args['headerTransaksiId'];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Transaksi'),
//       ),
//       body: FutureBuilder(
//         future: FirebaseFirestore.instance
//             .collection('header_transaksi')
//             .doc(headerTransaksiId)
//             .get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           Map<String, dynamic> data = snapshot.data.data();
//           DateTime tanggalTransaksi =
//               (data['tanggal_transaksi'] as Timestamp).toDate();

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Header Transaksi',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               ListTile(
//                 title: Text('ID Transaksi'),
//                 subtitle: Text(headerTransaksiId),
//               ),
//               ListTile(
//                 title: Text('Tanggal Transaksi'),
//                 subtitle: Text('${tanggalTransaksi.day}-${tanggalTransaksi.month}-${tanggalTransaksi.year}'),
//               ),
//               ListTile(
//                 title: Text('Total Harga'),
//                 subtitle: Text('Rp.${data['total_harga']}'),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Detail Transaksi',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection('detail_transaksi')
//                       .where('id_header_transaksi', isEqualTo: headerTransaksiId)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }

//                     QuerySnapshot detailTransaksi = snapshot.data;

//                     return ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: detailTransaksi.docs.length,
//                       itemBuilder: (context, index) {
//                         Map<String, dynamic> detail = detailTransaksi.docs[index].data();
//                         return ListTile(
//                           title: Text(detail['nama_produk']),
//                           subtitle: Text('Qty: ${detail['qty']}'),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:async';
// import 'home_roma.dart';

// void main() {
//   runApp(TransaksiDetailWidget1());
// }

// class TransaksiDetailWidget1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TransaksiDetailWidget2(),
//     );
//   }
// }

// class TransaksiDetailWidget2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Cart(),
//       child: MaterialApp(
//         title: 'kasir',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: HomePage(),
//         routes: {
//           // '/cart': (context) => CartPage(),
//           // '/checkout': (context) => CheckoutPage(),
//           // '/detail_transaksi': (context) => DetailTransaksi(),
//           '/detail_transaksi1': (context) => HalamanDetailTransaksi(),
//         },
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ChangeNotifierProvider(
//         create: (context) =>
//             Cart(), // Sediakan instance Cart di atas CustomerForm
//         child: CustomerForm(),
//       ),
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
//   String _selectedCustomerName;
//   List<Map<String, dynamic>> _customers = [];
//   bool _isCustomerSelected = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadCustomers();
//   }

//   Future<void> _loadCustomers() async {
//     // await Future.delayed(Duration(milliseconds: 500));
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
//     final cart = Provider.of<Cart>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: Text('Transaksi'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MyApp()),
//             );
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 16.0),
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(right: 5.0),
//                   child: IconButton(
//                     icon: Icon(Icons.shopping_cart),
//                     onPressed: _isCustomerSelected
//                         ? () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => CartPage(
//                                   customerName: _selectedCustomerName,
//                                   cartItems: cart.items,
//                                 ),
//                               ),
//                             );
//                           }
//                         : null, // Nonaktifkan ikon keranjang jika tidak ada pelanggan yang dipilih
//                   ),
//                 ),
//                 Expanded(
//                   child: DropdownButtonFormField(
//                     value: _selectedCustomerId,
//                     items: _customers.map((customer) {
//                       return DropdownMenuItem(
//                         value: customer['nama_pelanggan'],
//                         child: Text(customer['nama_pelanggan']),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedCustomerId = value;
//                         _selectedCustomerName =
//                             value; // Simpan nama pelanggan yang dipilih
//                         _isCustomerSelected = true; // Perbarui status pemilihan
//                       });
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Pilih Pelanggan',
//                       labelStyle: TextStyle(
//                         color: Colors.black,
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 if (_selectedCustomerId == null) {
//                   _showNotification('Please select a customer.');
//                 } else if (cart.items.isEmpty) {
//                   _showNotification('Cart is empty. Add items to the cart.');
//                 } else {
//                   _saveData(cart.totalAmount, context);

//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.red,
//               ),
//               child: Text('Save'),
//             ),
//             SizedBox(height: 9.0),
//             Text(
//               'Produk Terpilih: ${cart.items.length}', // Display the number of items
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 5.0),
//             Expanded(
//               child: StreamBuilder(
//                 stream:
//                     FirebaseFirestore.instance.collection('produk').snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: SizedBox(
//                         width: 50.0,
//                         height: 50.0,
//                         child: CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                           strokeWidth: 3.0,
//                         ),
//                       ),
//                     );
//                   }
//                   return ListView.builder(
//                     itemCount: snapshot.data.docs.length,
//                     itemBuilder: (context, index) {
//                       DocumentSnapshot item = snapshot.data.docs[index];
//                       Map<String, dynamic> data =
//                           item.data() as Map<String, dynamic>;

//                       double hargaJual = (data['harga_jual'] ?? 0.0) as double;
//                       bool isDiscountValid = _isDiscountValidForProduct(data);
//                       double diskon = (data['diskon'] ?? 0.0) as double;

//                       // Keterangan diskon
//                       String discountInfo = isDiscountValid
//                           ? 'Diskon ${diskon}% berlaku'
//                           : 'Tidak ada diskon';

//                       if (isDiscountValid) {
//                         hargaJual = hargaJual - diskon;
//                       }

//                       return ListTile(
//                         title: Text(
//                           item['nama_produk'],
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: isDiscountValid
//                             ? RichText(
//                                 text: TextSpan(
//                                   text: '\Rp $hargaJual, ',
//                                   style: DefaultTextStyle.of(context).style,
//                                   children: <TextSpan>[

//                                   ],
//                                 ),
//                               )
//                             : Text(
//                                 '\Rp $hargaJual',
//                               ),
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

//   void _showNotification(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }

// Future<void> _saveData(double totalAmount, BuildContext context) async {
//   final cart = Provider.of<Cart>(context, listen: false);
//   User user = FirebaseAuth.instance.currentUser;

//   // Tampilkan pop up atau gambar dari folder assets setelah klik save
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         // title: Text("Transaction Saved"),
//         content: Image.asset('assets/qr/QR bayar.jpeg'),
//       );
//     },
//   );

//   // Simpan data ke Firestore setelah 1 detik
//   Future.delayed(Duration(seconds: 15), () {
//     FirebaseFirestore.instance.collection('header_transaksi').add({
//       'id_customer': cart.items.isNotEmpty ? cart.items.first['id'] : null,
//       'tanggal_transaksi': Timestamp.now(),
//       'total_harga': totalAmount,
//       'id_kasir': user.uid,
//     }).then((headerTransaksiDoc) async {
//       final String headerTransaksiId = headerTransaksiDoc.id;

//       for (var item in cart.items) {
//         // Mengurangi stok produk di database
//         await FirebaseFirestore.instance
//             .collection('produk')
//             .doc(item['id'])
//             .update({
//           'stok': FieldValue.increment(-item['qty']),
//         });

//         // Menyimpan data detail transaksi
//         FirebaseFirestore.instance.collection('detail_transaksi').add({
//           'id_header_transaksi': headerTransaksiId,
//           'id_produk': item['id'],
//           'qty': item['qty'],
//         });
//       }

//       cart.clearCart();

//       Navigator.pushReplacementNamed(
//         context,
//         '/detail_transaksi1',
//         arguments: {'headerTransaksiId': headerTransaksiId},
//       );

//     }).catchError((error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to complete the transaction. Error: $error'),
//         ),
//       );
//     });
//   });
// }

//   bool _isDiscountValidForProduct(Map<String, dynamic> productData) {
//     // Mengambil informasi diskon dari data produk
//     double discount = productData['diskon'] ?? 0.0;
//     Timestamp expirationDate = productData['expiration_date'];
//     Timestamp activeDiscountDate = productData['active_discount_date'];

//     DateTime expirationDateTime = expirationDate?.toDate() ?? DateTime.now();
//     DateTime activeDiscountDateTime =
//         activeDiscountDate?.toDate() ?? DateTime.now();

//     Timestamp currentDate = Timestamp.now();

//     // Memeriksa berlakunya diskon berdasarkan tanggal
//     bool isDiscountValid = currentDate.toDate().isBefore(expirationDateTime) &&
//         currentDate.toDate().isAfter(activeDiscountDateTime);

//     return isDiscountValid;
//   }
// }

// class HalamanDetailTransaksi extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;

//     if (args != null && args.containsKey('headerTransaksiId')) {
//       final String headerTransaksiId = args['headerTransaksiId'];

//       return StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('header_transaksi')
//             .doc(headerTransaksiId)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Scaffold(
//               appBar: AppBar(
//                 title: Text('Detail Transaksi'),
//               ),
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }

//           var headerData = snapshot.data.data();
//           var kasirId = headerData['id_kasir'];
//           var idCustomer = headerData['id_customer'];
//           var tanggalTransaksiTimestamp = headerData['tanggal_transaksi'];
//           var totalHarga = headerData['total_harga'];

//           DateTime tanggalTransaksi = tanggalTransaksiTimestamp.toDate();

//           return Scaffold(
//             appBar: AppBar(
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Colors.white),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               title: Text('Detail Transaksi Ehe'),
//             ),
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (kasirId != null)
//                   FutureBuilder(
//                     future: FirebaseFirestore.instance
//                         .collection('users')
//                         .doc(kasirId)
//                         .get(),
//                     builder: (context, kasirSnapshot) {
//                       if (!kasirSnapshot.hasData) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text('Kasir: Loading...'),
//                         );
//                       }

//                       var kasirData = kasirSnapshot.data.data();
//                       var namaKasir = kasirData['username'];

//                       return Container(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Kasir: $namaKasir'),
//                             Text(
//                                 'Tanggal: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(tanggalTransaksi)}'),
//                             Text('Customer ID: $idCustomer'),
//                             Text('Total Harga: $totalHarga'),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 Expanded(
//                   child: FutureBuilder(
//                     future: FirebaseFirestore.instance
//                         .collection('detail_transaksi')
//                         .where('id_header_transaksi',
//                             isEqualTo: headerTransaksiId)
//                         .get(),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData) {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }

//                       var detailTransaksi = snapshot.data.docs;

//                       return FutureBuilder(
//                         future: _fetchProdukData(detailTransaksi),
//                         builder: (context, produkSnapshot) {
//                           if (!produkSnapshot.hasData) {
//                             return Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           }

//                           var produkData = produkSnapshot.data;

//                           return SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: DataTable(
//                               columns: [
//                                 DataColumn(label: Text('Nomor')),
//                                 DataColumn(label: Text('Nama Produk')),
//                                 DataColumn(label: Text('Qty')),
//                               ],
//                               rows: _buildDataRow(detailTransaksi, produkData),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Transaksi'),
//       ),
//       body: Center(
//         child: Text('Gagal memuat detail transaksi.'),
//       ),
//     );
//   }

//   Future<Map<String, dynamic>> _fetchProdukData(
//       List<QueryDocumentSnapshot> detailTransaksi) async {
//     Map<String, dynamic> produkData = {};

//     for (var detail in detailTransaksi) {
//       var produkId = detail.data()['id_produk'];
//       var produkSnapshot = await FirebaseFirestore.instance
//           .collection('produk')
//           .doc(produkId)
//           .get();
//       produkData[produkId] = produkSnapshot.data();
//     }

//     return produkData;
//   }

//   List<DataRow> _buildDataRow(List<QueryDocumentSnapshot> detailTransaksi,
//       Map<String, dynamic> produkData) {
//     List<DataRow> rows = [];

//     for (var index = 0; index < detailTransaksi.length; index++) {
//       var detail = detailTransaksi[index].data();
//       var produkId = detail['id_produk'];
//       var produkDetail = produkData[produkId];

//       rows.add(
//         DataRow(
//           cells: [
//             DataCell(Text((index + 1).toString())),
//             DataCell(Text(produkDetail['nama_produk'])),
//             DataCell(Text(detail['qty'].toString())),
//           ],
//         ),
//       );
//     }

//     return rows;
//   }
// }

void main() {
  runApp(TransaksiDetailWidget1());
}

class TransaksiDetailWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransaksiDetailWidget2(),
    );
  }
}

class TransaksiDetailWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        title: 'kasir',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {
          // '/cart': (context) => CartPage(),
          // '/checkout': (context) => CheckoutPage(),
          // '/detail_transaksi': (context) => DetailTransaksi(),
          '/detail_transaksi1': (context) => HalamanDetailTransaksi(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) =>
            Cart(), // Sediakan instance Cart di atas CustomerForm
        child: CustomerForm(),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////logika ws jalan ojo di utek2 yaa ws capek soale
class CustomerForm extends StatefulWidget {
  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final TextEditingController _nameController = TextEditingController();

  String _selectedCustomerId;
  String _selectedCustomerName;
  List<Map<String, dynamic>> _customers = [];
  bool _isCustomerSelected = false;

  Map<String, dynamic> get product => null;

  @override
  void initState() {
    super.initState();
    _loadCustomers();
  }

  Future<void> _loadCustomers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('pelanggan').get();
    setState(() {
      _customers = querySnapshot.docs.map((doc) {
        return {
          "id": doc.id,
          "nik": doc[
              'nik'], // Ubah sesuai dengan field yang sesuai di dokumen pelanggan
          ...doc.data()
        };
      }).toList();
    });
  }

  bool _isDiscountValidForProduct(Map<String, dynamic> productData) {
    // Mengambil informasi diskon dari data produk
    double discount = productData['diskon'] ?? 0.0;
    Timestamp expirationDate = productData['expiration_date'];
    Timestamp activeDiscountDate = productData['active_discount_date'];

    DateTime expirationDateTime = expirationDate?.toDate() ?? DateTime.now();
    DateTime activeDiscountDateTime =
        activeDiscountDate?.toDate() ?? DateTime.now();

    Timestamp currentDate = Timestamp.now();

    // Memeriksa berlakunya diskon berdasarkan tanggal
    bool isDiscountValid = currentDate.toDate().isBefore(expirationDateTime) &&
        currentDate.toDate().isAfter(activeDiscountDateTime);

    return isDiscountValid;
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Transaksi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: _isCustomerSelected
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartPage(
                                  customerName: _selectedCustomerName,
                                  cartItems: cart.items,
                                ),
                              ),
                            );
                          }
                        : null, // Nonaktifkan ikon keranjang jika tidak ada pelanggan yang dipilih
                  ),
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    value: _selectedCustomerId,
                    items: _customers.map((customer) {
                      return DropdownMenuItem(
                        // value: customer['nik'].toString(),
                        value: customer['id'],
                        child: Text(customer['nik'].toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCustomerId = value;
                        _selectedCustomerName =
                            value; // Simpan nama pelanggan yang dipilih
                        _isCustomerSelected = true; // Perbarui status pemilihan
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Pilih Pelanggan',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      cart.clearCart();
                      _showNotification('Cart cleared.');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text('Clear Cart'),
                  ),
                ),
                SizedBox(width: 8.0), // Jarak antara tombol Save dan Clear Cart
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_selectedCustomerId == null) {
                        _showNotification('Please select a customer.');
                      } else if (cart.items.isEmpty) {
                        _showNotification(
                        'Cart is empty. Add items to the cart.');
                      } else {
                        _saveData(cart.totalAmount, context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text('Payment'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 9.0),
            Text(
              'Produk Terpilih: ${cart.items.length}', // Display the number of items
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 5.0),
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('produk').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                          strokeWidth: 3.0,
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

                      double hargaJual = (data['harga_jual'] ?? 0.0) as double;
                      bool isDiscountValid = _isDiscountValidForProduct(data);
                      double diskon = (data['diskon'] ?? 0.0) as double;
                      double hargabeli = (data['harga_beli'] ?? 0.0) as double;

                      // Keterangan diskon
                      String discountInfo = isDiscountValid
                          ? 'Diskon ${diskon}% berlaku'
                          : 'Tidak ada diskon';

                      if (isDiscountValid) {
                        hargaJual = hargaJual - diskon;
                      }

                      return ListTile(
                        title: Text(
                          item['nama_produk'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: isDiscountValid
                            ? RichText(
                                text: TextSpan(
                                  text:
                                      '\Rp $hargaJual, Harga sudah termasuk diskon Rp. $diskon',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[],
                                ),
                              )
                            : Text(
                                '\Rp $hargaJual',
                              ),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .addItem(item);
                            // Provider.of<Cart>(context, listen: false)
                            //     .addProductToCart(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Produk ditambahkan ke keranjang.'),
                              ),
                            );
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

  void _showNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _saveData(double totalAmount, BuildContext context) async {
    final cart = Provider.of<Cart>(context, listen: false);
    User user = FirebaseAuth.instance.currentUser;

    print("Selected Customer ID: $_selectedCustomerId");
    print("Customers List: $_customers");

    // Tampilkan pop up atau gambar dari folder assets setelah klik save
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text("Transaction Saved"),
          content: Image.asset('assets/qr/QR bayar.jpeg'),
        );
      },
    );

    Future.delayed(Duration(seconds: 5), () async {
      FirebaseFirestore.instance.collection('header_transaksi').add({
        // 'id_customer': cart.items.isNotEmpty ? cart.items.first['id'] : null,
        'id_customer': _selectedCustomerId, // Menggunakan ID pelanggan
        // 'id_customer': _selectedCustomerId ?? null,
        'tanggal_transaksi': Timestamp.now(),
        'total_harga': totalAmount,
        'id_kasir': user.uid,
      }).then((headerTransaksiDoc) async {
        final String headerTransaksiId = headerTransaksiDoc.id;

        String idCustomer = await FirebaseFirestore.instance
            .collection('header_transaksi')
            .doc(headerTransaksiId)
            .get()
            .then((headerSnapshot) => headerSnapshot['id_customer']);

        for (var item in cart.items) {
          DocumentSnapshot productSnapshot = await FirebaseFirestore.instance
              .collection('produk')
              .doc(item['id'])
              .get();

          print("Product Snapshot Data: ${productSnapshot.data()}");

          if (productSnapshot.exists) {
            // Extracting product details from the document
            double discount = 0.0; // Default to no discount

            if (_selectedCustomerId != 'B3HE5z8nfqhhq1ls4PGY' &&
                _isDiscountValidForProduct(productSnapshot.data())) {
              discount = productSnapshot['diskon'] ?? 0.0;
            }

            double sellingPrice = productSnapshot['harga_jual'] ?? 0.0;
            double purchasePrice = productSnapshot['harga_beli'] ?? 0.0;
            int qty = item['qty'];

            // Calculate the total amount considering the discount
            double discountedTotal = (sellingPrice - discount) * qty;

            // Print the details before adding to Firestore
            print("Detail Transaksi: "
                "id_header_transaksi: $headerTransaksiId, "
                "id_produk: ${item['id']}, "
                "qty: $qty, "
                "harga_beli: $purchasePrice, "
                "harga_jual: $sellingPrice, "
                "diskon: $discount, "
                "total_harga: $discountedTotal\n\n");

            // Mengurangi stok produk di database
            await FirebaseFirestore.instance
                .collection('produk')
                .doc(item['id'])
                .update({
              'stok': FieldValue.increment(-qty),
            });

            // Menyimpan data detail transaksi
            FirebaseFirestore.instance.collection('detail_transaksi').add({
              'id_header_transaksi': headerTransaksiId,
              'id_produk': item['id'],
              'qty': qty,
              'harga_beli': purchasePrice,
              'harga_jual': sellingPrice,
              'diskon': discount,
              'total_harga': discountedTotal, // Harga setelah diskon
            });
            print(
                '--------------------------------------------------------------------------------------------');
          }
        }

        cart.clearCart();

        Navigator.pushReplacementNamed(
          context,
          '/detail_transaksi1',
          arguments: {'headerTransaksiId': headerTransaksiId},
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to complete the transaction. Error: $error'),
          ),
        );
      });
    });
  }
}

class Cart extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  bool _isDiscountValidForProduct(Map<String, dynamic> productData) {
    // Mengambil informasi diskon dari data produk
    double discount = productData['diskon'] ?? 0.0;
    Timestamp expirationDate = productData['expiration_date'];
    Timestamp activeDiscountDate = productData['active_discount_date'];

    DateTime expirationDateTime = expirationDate?.toDate() ?? DateTime.now();
    DateTime activeDiscountDateTime =
        activeDiscountDate?.toDate() ?? DateTime.now();

    Timestamp currentDate = Timestamp.now();

    // Memeriksa berlakunya diskon berdasarkan tanggal
    bool isDiscountValid = currentDate.toDate().isBefore(expirationDateTime) &&
        currentDate.toDate().isAfter(activeDiscountDateTime);

    return isDiscountValid;
  }

  void addProductToCart(Map<String, dynamic> product) {
    bool isDiscountValid = _isDiscountValidForProduct(product);
    double hargaJual = (product['harga_jual'] ?? 0.0) as double;
    double diskon = (product['diskon'] ?? 0.0) as double;

    _items.add({
      'product': product,
      'isDiscountValid': isDiscountValid,
      'hargaJual': hargaJual,
      'qty': 1,
    });

    notifyListeners();
  }

  bool isDiscountValid() {
    // Memeriksa apakah ada setidaknya satu produk di keranjang dengan diskon yang masih berlaku
    return _items.any((item) => item['isDiscountValid'] == true);
  }

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

  void updateQuantity(int index, int newQuantity) {
    _items[index]['qty'] = newQuantity;
    notifyListeners();
  }
}

// class CartPage extends StatefulWidget {
//   final String customerName;
//   final List<Map<String, dynamic>> cartItems;

//   CartPage({@required this.customerName, @required this.cartItems});

//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);

//     double totalAmount = cart.totalAmount;

//     bool isDiscountValid = cart.isDiscountValid();
//     double discountedAmount = isDiscountValid ? (totalAmount) : 0.0;
//     double finalAmount =
//         isDiscountValid ? (totalAmount - discountedAmount) : totalAmount;

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text('Shopping Cart'),
//         backgroundColor: Colors.red,
//       ),
//       body: ListView.builder(
//         itemCount: cart.items.length,
//         itemBuilder: (context, index) {
//           final item = cart.items[index];
//           print(
//               'Item $index: ${item['product']['nama_produk']} - ${item['hargaJual']} - Qty: ${item['qty']}');

//           return ListTile(
//             title: Text(item['product']['nama_produk']), // Update this line
//             subtitle: Row(
//               children: [
//                 Text('\Rp.${item['hargaJual']}'),
//                 SizedBox(width: 10),
//                 Text('Qty: ${item['qty']}'),
//               ],
//             ),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.edit),
//                   onPressed: () {
//                     _showEditDialog(context, cart, index);
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.delete),
//                   color: Colors.red,
//                   onPressed: () {
//                     Provider.of<Cart>(context, listen: false).removeItem(index);
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               color: Colors.grey[300],
//               padding: EdgeInsets.all(10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Total: Rp.${cart.totalAmount.toStringAsFixed(2)}',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               title: Text('Nama Pelanggan'),
//               subtitle: Text('${widget.customerName}'),
//             ),
//             Divider(),
//             ListTile(
//               title: Text('Total Pembayaran'),
//               subtitle: Text('\Rp$finalAmount'),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       padding:
//                           EdgeInsets.symmetric(vertical: 5, horizontal: 90),
//                       primary: Colors.red,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       child: Text('Clear Cart'),
//                     ),
//                     onPressed: () {
//                       Provider.of<Cart>(context, listen: false).clearCart();
//                     },
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       padding:
//                           EdgeInsets.symmetric(vertical: 5, horizontal: 90),
//                       primary: Colors.red,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       child: Text('Save'),
//                     ),
//                     onPressed: () {
//                       _showSaveDialog(context, cart);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Metode untuk menampilkan dialog edit jumlah produk di keranjang belanja
//   void _showEditDialog(BuildContext context, Cart cart, int index) {
//     int newQuantity = cart.items[index]['qty'];
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Edit Quantity'),
//           content: TextField(
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(labelText: 'New Quantity'),
//             onChanged: (value) {
//               newQuantity = int.tryParse(value) ?? newQuantity;
//             },
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('Confirm'),
//               onPressed: () {
//                 cart.updateQuantity(index, newQuantity);
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Metode untuk menampilkan dialog konfirmasi penyimpanan transaksi
//   void _showSaveDialog(BuildContext context, Cart cart) {
//     if (cart.items.isEmpty) {
//       _showNotification(context, 'Cart is empty!');
//       return;
//     }

//     if (cart.items.first['id'] == null) {
//       _showNotification(context, 'Please select a customer!');
//       return;
//     }

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Save Confirmation'),
//           content: Text('Are you sure you want to save this transaction?'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('Save'),
//               onPressed: () {
//                 _saveData(cart.totalAmount, context);
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Metode untuk menampilkan notifikasi
//   void _showNotification(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }

//   // Metode untuk menyimpan data transaksi ke Firestore
//   void _saveData(double totalAmount, BuildContext context) {
//     final cart = Provider.of<Cart>(context, listen: false);

//     User user = FirebaseAuth.instance.currentUser;

//     FirebaseFirestore.instance.collection('header_transaksi').add({
//       'id_customer': cart.items.isNotEmpty ? cart.items.first['id'] : null,
//       'tanggal_transaksi': Timestamp.now(),
//       'total_harga': totalAmount,
//       'id_kasir': user.uid,
//     }).then((headerTransaksiDoc) {
//       final String headerTransaksiId = headerTransaksiDoc.id;

//       for (var item in cart.items) {
//         FirebaseFirestore.instance.collection('detail_transaksi').add({
//           'id_header_transaksi': headerTransaksiId,
//           'id_produk': item['id'],
//           'qty': item['qty'],
//         });
//       }

//       cart.clearCart();

//       Navigator.pushReplacementNamed(
//         context,
//         '/detail_transaksi1',
//         arguments: {'headerTransaksiId': headerTransaksiId},
//       );
//     }).catchError((error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to complete the transaction. Error: $error'),
//         ),
//       );
//     });
//   }
// }

class CartPage extends StatelessWidget {
  final String customerName;
  final List<Map<String, dynamic>> cartItems;

  CartPage({@required this.customerName, @required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double grandTotal = Provider.of<Cart>(context).totalAmount;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Customer: $customerName',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> cartItem = cartItems[index];
                String productName = cartItem['nama_produk'];
                double hargaJual = cartItem['harga_jual'];
                int qty = cartItem['qty'];
                double totalHargaProduk = hargaJual * qty;

                return ListTile(
                  title: Text(productName),
                  subtitle: Text(
                      'Harga: Rp $hargaJual, Qty: $qty total: $totalHargaProduk'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _showEditDialog(
                              context, Provider.of<Cart>(context), index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          Provider.of<Cart>(context, listen: false)
                              .removeItem(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Implementasikan logika untuk menyelesaikan transaksi
                // atau kembali ke halaman sebelumnya
                Navigator.pop(context);
              },
              child: Text('Complete Transaction'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: Rp.$grandTotal',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Nama Pelanggan'),
              subtitle: Text('$customerName'),
            ),
            Divider(),
            ListTile(
              title: Text('Total Pembayaran'),
              subtitle: Text('\Rp$grandTotal'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 90),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 90),
                      primary: Colors.red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text('Save'),
                    ),
                    onPressed: () {
                      // _showSaveDialog(context, cart);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, Cart cart, int index) {
    int newQuantity = cart.items[index]['qty'];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Quantity'),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'New Quantity'),
            onChanged: (value) {
              newQuantity = int.tryParse(value) ?? newQuantity;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                cart.updateQuantity(index, newQuantity);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // void _showEditDialog(
  //     BuildContext context, Map<String, dynamic> cartItem, int index) {
  //   TextEditingController qtyController = TextEditingController();
  //   qtyController.text = cartItem['qty'].toString();

  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Edit Product'),
  //         content: SingleChildScrollView(
  //           child: Column(
  //             children: [
  //               TextFormField(
  //                 controller: qtyController,
  //                 keyboardType: TextInputType.number,
  //                 decoration: InputDecoration(labelText: 'Quantity'),
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               int newQty = int.tryParse(qtyController.text) ?? 0;
  //               if (newQty > 0) {
  //                 // Update quantity produk dalam keranjang
  //                 Provider.of<Cart>(context, listen: false)
  //                     .updateQuantity(index, newQty);
  //                 Navigator.pop(context);
  //               } else {
  //                 // Tampilkan pesan error jika quantity tidak valid
  //                 ScaffoldMessenger.of(context).showSnackBar(
  //                   SnackBar(
  //                     content: Text(
  //                         'Invalid quantity. Please enter a number greater than 0.'),
  //                   ),
  //                 );
  //               }
  //             },
  //             child: Text('Save'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}

class HalamanDetailTransaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;

    if (args != null && args.containsKey('headerTransaksiId')) {
      final String headerTransaksiId = args['headerTransaksiId'];

      return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('header_transaksi')
            .doc(headerTransaksiId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Detail Transaksi'),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          var headerData = snapshot.data.data();
          var kasirId = headerData['id_kasir'];
          var idCustomer = headerData['id_customer'];
          var tanggalTransaksiTimestamp = headerData['tanggal_transaksi'];
          var totalHarga = headerData['total_harga'];

          DateTime tanggalTransaksi = tanggalTransaksiTimestamp.toDate();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Detail Transaksi'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (kasirId != null)
                  FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(kasirId)
                        .get(),
                    builder: (context, kasirSnapshot) {
                      if (!kasirSnapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Kasir: Loading...'),
                        );
                      }

                      var kasirData = kasirSnapshot.data.data();
                      var namaKasir = kasirData['username'];

                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kasir: $namaKasir'),
                            Text(
                                'Tanggal: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(tanggalTransaksi)}'),
                            Text('Customer ID: $idCustomer'),
                            Text('Total Harga: $totalHarga'),
                          ],
                        ),
                      );
                    },
                  ),
                Expanded(
                  child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('detail_transaksi')
                        .where('id_header_transaksi',
                            isEqualTo: headerTransaksiId)
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      var detailTransaksi = snapshot.data.docs;

                      return FutureBuilder(
                        future: _fetchProdukData(detailTransaksi),
                        builder: (context, produkSnapshot) {
                          if (!produkSnapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          var produkData = produkSnapshot.data;

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: [
                                DataColumn(label: Text('Nomor')),
                                DataColumn(label: Text('Nama Produk')),
                                DataColumn(label: Text('Qty')),
                                DataColumn(label: Text('Harga')),
                                DataColumn(label: Text('Diskon')),
                                DataColumn(label: Text('Subtotal')),
                              ],
                              rows: _buildDataRow(detailTransaksi, produkData),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Transaksi'),
      ),
      body: Center(
        child: Text('Gagal memuat detail transaksi.'),
      ),
    );
  }

  Future<Map<String, dynamic>> _fetchProdukData(
      List<QueryDocumentSnapshot> detailTransaksi) async {
    Map<String, dynamic> produkData = {};

    for (var detail in detailTransaksi) {
      var produkId = detail.data()['id_produk'];
      var produkSnapshot = await FirebaseFirestore.instance
          .collection('produk')
          .doc(produkId)
          .get();
      produkData[produkId] = produkSnapshot.data();
    }

    return produkData;
  }

  List<DataRow> _buildDataRow(List<QueryDocumentSnapshot> detailTransaksi,
      Map<String, dynamic> produkData) {
    List<DataRow> rows = [];

    for (var index = 0; index < detailTransaksi.length; index++) {
      var detail = detailTransaksi[index].data();
      var produkId = detail['id_produk'];
      var produkDetail = produkData[produkId];

      rows.add(
        DataRow(
          cells: [
            DataCell(Text((index + 1).toString())),
            DataCell(Text(produkDetail['nama_produk'])),
            DataCell(Text(detail['qty'].toString())),
            DataCell(Text(detail['harga_jual'].toString())),
            DataCell(Text(detail['diskon'].toString())),
            DataCell(Text(detail['total_harga'].toString())),
          ],
        ),
      );
    }

    return rows;
  }
}
