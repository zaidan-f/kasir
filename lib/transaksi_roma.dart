import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'home_roma.dart';

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

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomerForm(),
//     );
//   }
// }

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

  @override
  void initState() {
    super.initState();
    _loadCustomers();
  }

  Future<void> _loadCustomers() async {
    // await Future.delayed(Duration(milliseconds: 500));
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
                        value: customer['nama_pelanggan'],
                        child: Text(customer['nama_pelanggan']),
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
            ElevatedButton(
              onPressed: () {
                if (_selectedCustomerId == null) {
                  _showNotification('Please select a customer.');
                } else if (cart.items.isEmpty) {
                  _showNotification('Cart is empty. Add items to the cart.');
                } else {
                  _saveData(cart.totalAmount, context);
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       title: Text("Confirm Save"),
                  //       content:
                  //           Text("Are you sure you want to save the data?"),
                  //       actions: [
                  //         TextButton(
                  //           onPressed: () {
                  //             Navigator.pop(context); // Close the dialog
                  //           },
                  //           child: Text("Cancel"),
                  //         ),
                  //         ElevatedButton(
                  //           onPressed: () {
                  //             Navigator.pop(context); // Close the dialog
                  //             _saveData(cart.totalAmount, context);
                  //           },
                  //           style: ElevatedButton.styleFrom(
                  //             primary: Colors.red,
                  //           ),
                  //           child: Text("Save"),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('Save'),
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
                                  text: '\Rp $hargaJual, ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    // TextSpan(
                                    //   text: 'Diskon Rp $diskon berlaku',
                                    //   style: TextStyle(
                                    //     color: Colors.red,
                                    //   ),
                                    // ),
                                  ],
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

//   BuildContext _validContext;
//   void _saveData(double totalAmount, BuildContext context) {
//     _validContext = context; // Simpan context yang valid
//     final cart = Provider.of<Cart>(context, listen: false);

//     User user = FirebaseAuth.instance.currentUser;

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Konfirmasi'),
//           content: Text('Apakah Anda yakin ingin menyimpan transaksi ini?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 _addToFirestore(totalAmount, context, cart, user);
//               },
//               child: Text('Ya'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Tidak'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _addToFirestore(
//       double totalAmount, BuildContext context, Cart cart, User user) {
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

//       // final String headerTransaksiId = headerTransaksiDoc.id;
//       print('Header Transaksi ID: $headerTransaksiId');

//       // Navigator.pushReplacementNamed(
//       //   context,
//       //   '/detail_transaksi1',
//       //   arguments: {'headerTransaksiId': headerTransaksiId},
//       // );
//       Navigator.pushReplacement(
//   context,
//   MaterialPageRoute(
//     builder: (context) => HalamanDetailTransaksi(headerTransaksiId: headerTransaksiId),
//   ),
// );
//     }).catchError((error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Gagal menyelesaikan transaksi. Error: $error'),
//         ),
//       );
//     });
//   }

//  Future<void> _saveData(double totalAmount, BuildContext context) async {
//   final cart = Provider.of<Cart>(context, listen: false);
//   User user = FirebaseAuth.instance.currentUser;

//   // Tampilkan pop up atau gambar dari folder assets setelah klik save
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         // title: Text("Transaction Saved"),
//         content: Image.asset('assets/image_name.png'), // Ganti image_name.png dengan nama gambar yang ingin ditampilkan
//       );
//     },
//   );

//   // Navigasi ke halaman detail transaksi setelah 15 detik
//   Future.delayed(Duration(seconds: 15), () {
//     Navigator.pushReplacementNamed(
//       context,
//       '/detail_transaksi1',
//       arguments: {'headerTransaksiId': headerTransaksiId},
//     );
//   });
// }

//     // Simpan data ke Firestore setelah 20 detik
//     Future.delayed(Duration(seconds: 1), () {
//       FirebaseFirestore.instance.collection('header_transaksi').add({
//         'id_customer': cart.items.isNotEmpty ? cart.items.first['id'] : null,
//         'tanggal_transaksi': Timestamp.now(),
//         'total_harga': totalAmount,
//         'id_kasir': user.uid,
//       }).then((headerTransaksiDoc) async {
//         final String headerTransaksiId = headerTransaksiDoc.id;

//         for (var item in cart.items) {
//           // Mengurangi stok produk di database
//           await FirebaseFirestore.instance
//               .collection('produk')
//               .doc(item['id'])
//               .update({
//             'stok': FieldValue.increment(-item['qty']),
//           });

//           // Menyimpan data detail transaksi
//           FirebaseFirestore.instance.collection('detail_transaksi').add({
//             'id_header_transaksi': headerTransaksiId,
//             'id_produk': item['id'],
//             'qty': item['qty'],
//           });
//         }

//         cart.clearCart();

//         Navigator.pushReplacementNamed(
//           context,
//           '/detail_transaksi1',
//           arguments: {'headerTransaksiId': headerTransaksiId},
//         );

//         // Navigator.pushReplacement(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) =>
//         //         HalamanDetailTransaksi(headerTransaksiId: headerTransaksiId),
//         //   ),
//         // );
//       }).catchError((error) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to complete the transaction. Error: $error'),
//           ),
//         );
//       });
//     });
//   }

Future<void> _saveData(double totalAmount, BuildContext context) async {
  final cart = Provider.of<Cart>(context, listen: false);
  User user = FirebaseAuth.instance.currentUser;

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

  // Simpan data ke Firestore setelah 1 detik
  Future.delayed(Duration(seconds: 15), () {
    FirebaseFirestore.instance.collection('header_transaksi').add({
      'id_customer': cart.items.isNotEmpty ? cart.items.first['id'] : null,
      'tanggal_transaksi': Timestamp.now(),
      'total_harga': totalAmount,
      'id_kasir': user.uid,
    }).then((headerTransaksiDoc) async {
      final String headerTransaksiId = headerTransaksiDoc.id;

      for (var item in cart.items) {
        // Mengurangi stok produk di database
        await FirebaseFirestore.instance
            .collection('produk')
            .doc(item['id'])
            .update({
          'stok': FieldValue.increment(-item['qty']),
        });

        // Menyimpan data detail transaksi
        FirebaseFirestore.instance.collection('detail_transaksi').add({
          'id_header_transaksi': headerTransaksiId,
          'id_produk': item['id'],
          'qty': item['qty'],
        });
      }

      cart.clearCart();

      Navigator.pushReplacementNamed(
        context,
        '/detail_transaksi1',
        arguments: {'headerTransaksiId': headerTransaksiId},
      );

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) =>
      //         HalamanDetailTransaksi(headerTransaksiId: headerTransaksiId),
      //   ),
      // );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to complete the transaction. Error: $error'),
        ),
      );
    });
  });
}

  // Future<void> _saveData(double totalAmount, BuildContext context) async {
  //   final cart = Provider.of<Cart>(context, listen: false);

  //   // void _saveData(double totalAmount, BuildContext context) {
  //   //   final cart = Provider.of<Cart>(context, listen: false);

  //   User user = FirebaseAuth.instance.currentUser;

  //   FirebaseFirestore.instance.collection('header_transaksi').add({
  //     'id_customer': cart.items.isNotEmpty ? cart.items.first['id'] : null,
  //     'tanggal_transaksi': Timestamp.now(),
  //     'total_harga': totalAmount,
  //     'id_kasir': user.uid,
  //   }).then((headerTransaksiDoc) async {
  //     final String headerTransaksiId = headerTransaksiDoc.id;

  //     for (var item in cart.items) {
  //       // Mengurangi stok produk di database
  //       await FirebaseFirestore.instance
  //           .collection('produk')
  //           .doc(item['id'])
  //           .update({
  //         'stok': FieldValue.increment(-item['qty']),
  //       });

  //       // Menyimpan data detail transaksi
  //       FirebaseFirestore.instance.collection('detail_transaksi').add({
  //         'id_header_transaksi': headerTransaksiId,
  //         'id_produk': item['id'],
  //         'qty': item['qty'],
  //       });
  //     }

  //     cart.clearCart();

  //     Navigator.pushReplacementNamed(
  //       context,
  //       '/detail_transaksi1',
  //       arguments: {'headerTransaksiId': headerTransaksiId},
  //     );
  //   }).catchError((error) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Failed to complete the transaction. Error: $error'),
  //       ),
  //     );
  //   });
  // }

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
}

//         ),
//       );
//     });
//   }
// }

class Cart extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  // Metode dan properti lainnya...

  // void addProductToCart(Map<String, dynamic> product) {
  //   // Memeriksa berlakunya diskon produk dan menambahkannya ke keranjang
  //   // bool isDiscountValid = _isDiscountValidForProduct(product);
  //   // _items.add({'product': product, 'isDiscountValid': isDiscountValid});
  //   // Memeriksa berlakunya diskon produk dan menambahkannya ke keranjang
  //   bool isDiscountValid = _isDiscountValidForProduct(product);

  //   // Dapatkan harga dan diskon produk
  //   double hargaJual = (product['harga_jual'] ?? 0.0) as double;
  //   double diskon = (product['diskon'] ?? 0.0) as double;

  //   // Tambahkan produk ke keranjang dengan harga, diskon, dan detail lainnya
  //   _items.add({
  //     'product': product,
  //     'isDiscountValid': isDiscountValid,
  //     'hargaJual': hargaJual,
  //     'diskon': diskon,
  //   });
  //   // Memberi tahu listener bahwa terjadi perubahan pada keranjang
  //   notifyListeners();
  // }

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
      'diskon': diskon,
      'qty': 1,
    });

    notifyListeners();
  }

  // bool _isDiscountValidForProduct(Map<String, dynamic> productData) {
  //   DateTime expirationDateTime = productData['expiration_date'].toDate();
  //   DateTime currentDate = DateTime.now();

  //   return currentDate.isBefore(expirationDateTime);
  // }

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

class CartPage extends StatefulWidget {
  final String customerName;
  final List<Map<String, dynamic>> cartItems;
  CartPage({@required this.customerName, @required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    // bool _isDiscountValidForProduct(Map<String, dynamic> productData) {
    //   // Mengambil informasi diskon dari data produk
    //   double discount = productData['diskon'] ?? 0.0;
    //   Timestamp expirationDate = productData['expiration_date'];
    //   Timestamp activeDiscountDate = productData['active_discount_date'];

    //   DateTime expirationDateTime = expirationDate?.toDate() ?? DateTime.now();
    //   DateTime activeDiscountDateTime =
    //       activeDiscountDate?.toDate() ?? DateTime.now();

    //   Timestamp currentDate = Timestamp.now();

    //   // Memeriksa berlakunya diskon berdasarkan tanggal
    //   bool isDiscountValid =
    //       currentDate.toDate().isBefore(expirationDateTime) &&
    //           currentDate.toDate().isAfter(activeDiscountDateTime);

    //   return isDiscountValid;
    // }

    // Menghitung total harga tanpa diskon
    double totalAmount = cart.totalAmount;

    // // Menghitung total harga dengan diskon jika berlaku
    bool isDiscountValid = cart
        .isDiscountValid(); // Anda perlu menambahkan metode ini di kelas Cart
    double discountedAmount =
        isDiscountValid ? (totalAmount) : 0.0; // Misalnya, diskon 10%
    double finalAmount =
        isDiscountValid ? (totalAmount - discountedAmount) : totalAmount;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Shopping Cart'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        // itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item['nama_produk']),
            subtitle: Row(
              children: [
                Text('\Rp.${item['harga_jual']}'),
                // Text('\Rp.${item['Diskon']}'),
                SizedBox(width: 10),
                Text('Qty: ${item['qty']}'),
              ],
            ),
            trailing: Row(
              mainAxisSize:
                  MainAxisSize.min, // Wraps icons within available space
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showEditDialog(context, cart, index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color:
                      Colors.red, // Optional: Set a distinct color for delete
                  onPressed: () {
                    Provider.of<Cart>(context, listen: false).removeItem(index);
                  },
                ),
              ],
            ),
          );
        },
      ),

      // body: ListView.builder(
      //   itemCount: widget.cartItems.length,
      //   itemBuilder: (context, index) {
      //     final item = widget.cartItems[index];
      //     double hargaJual = item['hargaJual'] ?? 0.0;
      //     double diskon = item['diskon'] ?? 0.0;
      //     double totalHarga = (hargaJual - diskon) * item['qty'];

      //     print("$diskon");

      //     return ListTile(
      //       title: Text(item['nama_produk']),
      //       subtitle: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Row(
      //             children: [
      //               Text(
      //                 '\Rp ${hargaJual.toStringAsFixed(2)}',
      //                 style: TextStyle(
      //                   color: Color.fromARGB(255, 73, 39, 36),
      //                 ),
      //               ),
      //               Text(' Diskon: Diskon Rp ${diskon} berlaku'),
      //             ],
      //           ),
      //           Text('Qty: ${item['qty']}'),
      //           Text('Total: \Rp ${totalHarga.toStringAsFixed(2)}'),
      //         ],
      //       ),
      //       trailing: Row(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           IconButton(
      //             icon: Icon(Icons.edit),
      //             onPressed: () {
      //               _showEditDialog(context, cart, index);
      //             },
      //           ),
      //           IconButton(
      //             icon: Icon(Icons.delete),
      //             color: Colors.red,
      //             onPressed: () {
      //               Provider.of<Cart>(context, listen: false).removeItem(index);
      //             },
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),

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
                    'Total: Rp.${cart.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     isDiscountValid
            //         ? 'Anda mendapatkan diskon 10%!'
            //         : 'Diskon tidak berlaku untuk produk di keranjang Anda.',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: isDiscountValid ? Colors.green : Colors.red,
            //     ),
            //   ),
            // ),
            ListTile(
              title: Text('Nama Pelanggan'),
              subtitle: Text(
                '${widget.customerName}',
              ),
            ),
            // ListTile(
            //   title: Text('Diskon'),
            //   subtitle: Text(isDiscountValid
            //       ? '-\Rp$discountedAmount'
            //       : 'Tidak Ada Diskon'),
            // ),
            Divider(),
            ListTile(
              title: Text('Total Pembayaran'),
              subtitle: Text('\Rp$finalAmount'),
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
                      _showSaveDialog(context, cart);
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
                // Update to Firebase here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSaveDialog(BuildContext context, Cart cart) {
    if (cart.items.isEmpty) {
      _showNotification(context, 'Cart is empty!');
      return;
    }

    // Check if customer is selected (you may need to adjust this condition based on your customer selection logic)
    if (cart.items.first['id'] == null) {
      _showNotification(context, 'Please select a customer!');
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Confirmation'),
          content: Text('Are you sure you want to save this transaction?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                // _saveData(cart.totalAmount, context);
                // Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                _saveData(cart.totalAmount, context);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

//////////////////////ini untuk yang di halaman cart
  void _saveData(double totalAmount, BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    User user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection('header_transaksi').add({
      'id_customer': cart.items.isNotEmpty ? cart.items.first['id'] : null,
      'tanggal_transaksi': Timestamp.now(),
      'total_harga': totalAmount,
      'id_kasir': user.uid,
    }).then((headerTransaksiDoc) {
      final String headerTransaksiId = headerTransaksiDoc.id;

      for (var item in cart.items) {
        FirebaseFirestore.instance.collection('detail_transaksi').add({
          'id_header_transaksi': headerTransaksiId,
          'id_produk': item['id'],
          'qty': item['qty'],
        });
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
  }
  // Future<void> _showSaveDialog(BuildContext context) async {
  //   final cart = Provider.of<Cart>(context);
  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Pop-up Title'),
  //         content: Text('Isi pop-up di sini'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               // Tutup pop-up
  //               _saveData(cart.totalAmount, context);
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void _saveData(double totalAmount, BuildContext context) {
  //   final cart = Provider.of<Cart>(context, listen: false);

  //   User user = FirebaseAuth.instance.currentUser;

  //   FirebaseFirestore.instance.collection('header_transaksi').add({
  //     'id_customer': cart.items.isNotEmpty ? cart.items.first['id'] : null,
  //     'tanggal_transaksi': Timestamp.now(),
  //     'total_harga': totalAmount,
  //     'id_kasir': user.uid,
  //   }).then((headerTransaksiDoc) {
  //     final String headerTransaksiId = headerTransaksiDoc.id;

  //     for (var item in cart.items) {
  //       FirebaseFirestore.instance.collection('detail_transaksi').add({
  //         'id_header_transaksi': headerTransaksiId,
  //         'id_produk': item['id'],
  //         'qty': item['qty'],
  //       });
  //     }

  //     cart.clearCart();

  //     Navigator.pushReplacementNamed(
  //       context,
  //       '/detail_transaksi1',
  //       arguments: {'headerTransaksiId': headerTransaksiId},
  //     );
  //   }).catchError((error) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Failed to complete the transaction. Error: $error'),
  //       ),
  //     );
  //   });
  // }
}

// class Cart extends ChangeNotifier {
//   List<Map<String, dynamic>> _items = [];

//   List<Map<String, dynamic>> get items => _items;

//   double get totalAmount {
//     return _items.fold(0, (sum, item) {
//       double hargaJual = item['harga_jual'] is String
//           ? double.tryParse(item['harga_jual']) ?? 0
//           : (item['harga_jual'] ?? 0).toDouble();
//       return sum + (item['qty'] * hargaJual);
//     });
//   }

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
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white), // Ikon kembali
//           onPressed: () {
//             Navigator.pop(context); // Fungsi untuk kembali
//           },
//         ),
//         title: Text('Shopping Cart'), // Judul AppBar
//         backgroundColor: Colors.red, // Warna latar belakang AppBar
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
//           padding: const EdgeInsets.all(10.0),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               primary: Colors.red,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               child: Text('Clear Cart'),
//             ),
//             onPressed: () {
//               Provider.of<Cart>(context, listen: false).clearCart();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HalamanDetailTransaksi extends StatelessWidget {
//   final String headerTransaksiId;
//   const HalamanDetailTransaksi({Key key, @required this.headerTransaksiId}) : super(key: key);
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
//                 leading: IconButton(
//                   icon: Icon(Icons.arrow_back, color: Colors.white),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
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
//               backgroundColor: Colors.red,
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Colors.white),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => TransaksiDetailWidget1()),
//                   );
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
//                                 DataColumn(label: Text('Nama Produk')),
//                                 DataColumn(
//                                   label: Text('Qty'),
//                                   numeric: true,
//                                 ),
//                                 DataColumn(
//                                   label: Text('Harga'),
//                                   numeric: true,
//                                 ),
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
//       var harga = produkDetail['harga_jual']; // Menambahkan harga barang

//       rows.add(
//         DataRow(
//           cells: [
//             DataCell(Text(produkDetail['nama_produk'])),
//             DataCell(Text(detail['qty'].toString())),
//             DataCell(Text('Rp ${harga.toString()}')),
//           ],
//         ),
//       );
//     }

//     return rows;
//   }
// }

// class HalamanDetailTransaksi extends StatelessWidget {
//   final String headerTransaksiId;
//   const HalamanDetailTransaksi({Key key, @required this.headerTransaksiId})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;

//     if (args != null && args.containsKey('headerTransaksiId')) {
//       final String passedHeaderTransaksiId = args[
//           'headerTransaksiId']; // Ubah nama variabel menjadi passedHeaderTransaksiId

//       return StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('header_transaksi')
//             .doc(
//                 passedHeaderTransaksiId) // Gunakan passedHeaderTransaksiId di sini
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Scaffold(
//               appBar: AppBar(
//                 title: Text('Detail Transaksi'),
//                 leading: IconButton(
//                   icon: Icon(Icons.arrow_back, color: Colors.white),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
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
//               backgroundColor: Colors.red,
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Colors.white),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => TransaksiDetailWidget1()),
//                   );
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
//                             isEqualTo:
//                                 passedHeaderTransaksiId) // Gunakan passedHeaderTransaksiId di sini
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
//                                 DataColumn(label: Text('Nama Produk')),
//                                 DataColumn(
//                                   label: Text('Qty'),
//                                   numeric: true,
//                                 ),
//                                 DataColumn(
//                                   label: Text('Harga'),
//                                   numeric: true,
//                                 ),
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
//       var harga = produkDetail['harga_jual']; // Menambahkan harga barang

//       rows.add(
//         DataRow(
//           cells: [
//             DataCell(Text(produkDetail['nama_produk'])),
//             DataCell(Text(detail['qty'].toString())),
//             DataCell(Text('Rp ${harga.toString()}')),
//           ],
//         ),
//       );
//     }

//     return rows;
//   }
// }


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
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Detail Transaksi Ehe'),
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
          ],
        ),
      );
    }

    return rows;
  }
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';

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
//                             Text('Tanggal: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(tanggalTransaksi)}'),
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
//                         .where('id_header_transaksi', isEqualTo: headerTransaksiId)
//                         .get(),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData) {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }

//                       var detailTransaksi = snapshot.data.docs;

//                       List<DataRow> dataRows = [];

//                       for (var index = 0; index < detailTransaksi.length; index++) {
//                         var detail = detailTransaksi[index].data();

//                         return FutureBuilder(
//                           future: FirebaseFirestore.instance
//                               .collection('produk')
//                               .doc(detail['id_produk'])
//                               .get(),
//                           builder: (context, produkSnapshot) {
//                             if (!produkSnapshot.hasData) {
//                               return Container();
//                             }

//                             var produkData = produkSnapshot.data.data();
//                             var namaProduk = produkData['nama_produk'];

//                             dataRows.add(
//                               DataRow(
//                                 cells: [
//                                   DataCell(Text((index + 1).toString())), // Number
//                                   DataCell(Text(namaProduk)), // Product Name
//                                   DataCell(Text(detail['qty'].toString())), // Qty
//                                 ],
//                               ),
//                             );

//                             if (index == detailTransaksi.length - 1) {
//                               return DataTable(
//                                 columns: [
//                                   DataColumn(label: Text('Nomor')),
//                                   DataColumn(label: Text('Nama Produk')),
//                                   DataColumn(label: Text('Qty')),
//                                 ],
//                                 rows: dataRows,
//                               );
//                             } else {
//                               return Container();
//                             }
//                           },
//                         );
//                       }

//                       return Container();
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
// }

// class HalamanDetailTransaksi extends StatelessWidget {
//   final String headerTransaksiId;

//   // HalamanDetailTransaksi({required this.headerTransaksiId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Transaksi yyyy'),
//       ),
//       body: FutureBuilder<Widget>(
//         future: fetchData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             return snapshot.data ?? Container(); // Gunakan Container() jika data null
//           }
//         },
//       ),
//     );
//   }

//   Future<Widget> fetchData() async {
//     try {
//       var detailTransaksi = await FirebaseFirestore.instance
//           .collection('detail_transaksi')
//           .where('id_header_transaksi', isEqualTo: headerTransaksiId)
//           .get();

//       List<DataRow> rows = [];

//       await Future.forEach(detailTransaksi.docs, (detail) async {
//         var detailData = detail.data() as Map<String, dynamic>;
//         var productId = detailData['id_produk'];
//         var qty = detailData['qty'] as int;

//         var productSnapshot = await FirebaseFirestore.instance
//           .collection('produk')
//           .doc(productId)
//           .get();

//         if (productSnapshot.exists) {
//           var productData = productSnapshot.data() as Map<String, dynamic>;
//           var namaBarang = productData['nama_produk'] as String;
//           var harga = productData['harga'] as int;

//           // Hitung Subtotal
//           var subtotal = qty * harga;

//           rows.add(DataRow(
//             cells: [
//               DataCell(Text('')), // Nomor
//               DataCell(Text(namaBarang)), // Nama Barang
//               DataCell(Text(harga.toString())), // Harga
//               DataCell(Text(qty.toString())), // Qty
//               DataCell(Text(subtotal.toString())), // Subtotal
//             ],
//           ));
//         }
//       });

//       return DataTable(
//         columns: [
//           DataColumn(label: Text('Nomor')),
//           DataColumn(label: Text('Nama Barang')),
//           DataColumn(label: Text('Harga')),
//           DataColumn(label: Text('Qty')),
//           DataColumn(label: Text('Subtotal')),
//         ],
//         rows: rows,
//       );
//     } catch (error) {
//       print('Error fetching data: $error');
//       throw error;
//     }
//   }
// }
