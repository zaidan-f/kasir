import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(TransaksiDetailWidget1());
}

class TransaksiDetailWidget1 extends StatelessWidget {
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
          '/detail_transaksi': (context) => DetailTransaksi(),
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
    final cart = Provider.of<Cart>(context);
    return Scaffold(
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
                _saveData(cart.totalAmount,
                    context); // Pastikan untuk menyediakan totalAmount dan context
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
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

  void _saveData(double totalAmount, BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    User user = FirebaseAuth.instance.currentUser;
    // String usernameKasir = user != null ? user.displayName ?? '' : '';

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

      cart.clearCart(); // Bersihkan keranjang setelah checkout

      // Pindah ke halaman detail_transaksi dan kirim headerTransaksiId
      Navigator.pushReplacementNamed(
        context,
        '/detail_transaksi1',
        arguments: {'headerTransaksiId': headerTransaksiId},
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menyelesaikan transaksi. Error: $error'),
        ),
      );
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
      ),
    );
  }
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
          var tanggalTransaksiTimestamp = headerData['tanggal_transaksi'];
          var idCustomer = headerData['id_customer'];
          var totalHarga = headerData['total_harga'];

          // Convert timestamp to DateTime
          var tanggalTransaksi = DateTime.fromMillisecondsSinceEpoch(
              tanggalTransaksiTimestamp.millisecondsSinceEpoch);

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Detail Transaksi yyyy'),
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
                            Text('Tanggal: ${DateFormat('dd/MM/yyyy').format(tanggalTransaksi)}'), // Format the date as "dd/MM/yyyy"
                            Text('Customer ID: $idCustomer'),
                            Text('Total Harga: $totalHarga'),
                          ],
                        ),
                      );
                    },
                  ),
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('detail_transaksi')
                        .where('id_header_transaksi',
                            isEqualTo: headerTransaksiId)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      var detailTransaksi = snapshot.data.docs;

                      return ListView.builder(
                        itemCount: detailTransaksi.length,
                        itemBuilder: (context, index) {
                          var detail = detailTransaksi[index].data();
                          // Ambil informasi produk berdasarkan id_produk dari detail_transaksi
                          return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('produk')
                                .doc(detail['id_produk'])
                                .get(),
                            builder: (context, produkSnapshot) {
                              if (!produkSnapshot.hasData) {
                                return ListTile(
                                  title:
                                      Text('Produk ID: ${detail['id_produk']}'),
                                  subtitle: Text('Qty: ${detail['qty']}'),
                                );
                              }

                              var produkData = produkSnapshot.data.data();
                              var namaProduk = produkData['nama_produk'];

                              return ListTile(
                                title: Text('Nama Produk: $namaProduk'),
                                subtitle: Text('Qty: ${detail['qty']}'),
                              );
                            },
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

    // Jika tidak ada headerTransaksiId, tampilkan pesan kesalahan atau kembali ke halaman sebelumnya
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Transaksi'),
      ),
      body: Center(
        child: Text('Gagal memuat detail transaksi.'),
      ),
    );
  }
}

class DetailTransaksi extends StatefulWidget {
  @override
  _DetailTransaksiState createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context); // Access the cart
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Detail Transaksi'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            title: FutureBuilder(
              future: _getProductName(item['id_produk']),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                return Text(snapshot.data ?? 'Unknown Product');
              },
            ),
            subtitle: Text('Qty: ${item['qty']}'),
          );
        },
      ),
    );
  }

  Future<String> _getProductName(String productId) async {
    DocumentSnapshot productSnapshot = await FirebaseFirestore.instance
        .collection('produk')
        .doc(productId)
        .get();
    return productSnapshot['nama_produk'];
  }
}
