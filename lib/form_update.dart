import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'list_barang_roma.dart';

class FormPageUpdate extends StatefulWidget {
  //constructor have one parameter, optional paramter
  //if have id we will show data and run update method
  //else run add data
  const FormPageUpdate({this.id});

  final String id;

  @override
  State<FormPageUpdate> createState() => _FormPageState();
}

class _FormPageState extends State<FormPageUpdate> {
  //set form key
  final _formKey = GlobalKey<FormState>();

  //set texteditingcontroller variable
  var nameController = TextEditingController();
  var kategoriController = TextEditingController();
  var stokController = TextEditingController();
  var hargabeliController = TextEditingController();
  var hargajualController = TextEditingController();
  var diskonController = TextEditingController(); // Controller for diskon
  var masaBerlakuDiskonController =
      TextEditingController(); // Controller for masa berlaku diskon

  //inisialize firebase instance
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference produk;

  String _selectedKategori;
  List<Map<String, dynamic>> _kategori = [];

  Future<void> _loadKategori() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('kategori').get();
    setState(() {
      _kategori = querySnapshot.docs
          .map((doc) => {"nama_kat": doc.id, ...doc.data()})
          .toList();
    });
  }

  void getData() async {
    //get produk collection from firebase
    //collection is table in mysql
    produk = firebase.collection('produk');

    //if have id
    if (widget.id != null) {
      //get produk data based on id document
      var data = await produk.doc(widget.id).get();

      //we get data.data()
      //so that it can be accessed, we make as a map
      var item = data.data() as Map<String, dynamic>;

      //set state to fill data controller from data firebase
      setState(() {
        nameController = TextEditingController(text: item['nama_produk']);
        // kategoriController = TextEditingController(text: item['kategori']);
        stokController = TextEditingController(text: item['stok']);
        hargabeliController = TextEditingController(text: item['harga_beli']);
        hargajualController = TextEditingController(text: item['harga_jual']);
        diskonController = TextEditingController(
            text: item['diskon'].toString()); // Fill diskon value if exists
        masaBerlakuDiskonController = TextEditingController(
            text: item['masa_berlaku_diskon']
                .toString()); // Fill masa berlaku diskon value if exists
      });
    }
  }

  @override
  void initState() {
    getData();
    // getKategoriList(); // Tambahkan ini
    _loadKategori();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Data Produk"),
        backgroundColor: Colors.red,
        actions: [
          //if have data show delete button
          widget.id != null
              ? IconButton(
                  onPressed: () {
                    //method to delete data based on id
                    produk.doc(widget.id).delete();

                    //back to main page
                    // '/' is home
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);
                  },
                  icon: Icon(Icons.delete))
              : SizedBox()
        ],
      ),
      //this form for add and edit data
      //if have id passed from main, field will show data
      body: Form(
        key: _formKey,
        child: ListView(padding: EdgeInsets.all(16.0), children: [
          SizedBox(height: 10),
          Text(
            'Nama produk',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Nama produk",
              filled: true,
              fillColor: Color(0xFFF1F4F8),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border focus
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Harap isi bidang ini!';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 14,
            ),
            cursorColor: Colors.red,
          ),
          SizedBox(height: 20),
          Text(
            'Kategori produk',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          // DropdownButtonFormField(
          //   value: _selectedKategori,
          //   items: _kategori.map((kategori) {
          //     return DropdownMenuItem(
          //       value: kategori['nama_kat'],
          //       child: Text(kategori['nama_kat']),
          //     );
          //   }).toList(),
          //   onChanged: (value) {
          //     setState(() {
          //       _selectedKategori = value;
          //     });
          //   },
          //   decoration: InputDecoration(
          //     labelText: 'Select kategori',
          //   ),
          // ),
          DropdownButtonFormField(
            value: _selectedKategori,
            items: _kategori.map((kategori) {
              return DropdownMenuItem(
                value: kategori['nama_kat'],
                child: Text(
                  kategori['nama_kat'],
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedKategori = value;
              });
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              filled: true,
              fillColor: Color(0xFFF1F4F8),
              border: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border
                // borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Stok barang',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: stokController,
            decoration: InputDecoration(
              hintText: "Input stok barang",
              filled: true,
              fillColor: Color(0xFFF1F4F8),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border focus
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Harap isi bidang ini!';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 14,
            ),
            cursorColor: Colors.red,
          ),
          SizedBox(height: 20),
          Text(
            'Harga beli',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: hargabeliController,
            decoration: InputDecoration(
              hintText: "Input harga beli produk",
              filled: true,
              fillColor: Color(0xFFF1F4F8),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border focus
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Harap isi bidang ini!';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 14,
            ),
            cursorColor: Colors.red,
          ),
          SizedBox(height: 20),
          Text(
            'Harga jual',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: hargajualController,
            decoration: InputDecoration(
              hintText: "Input harga jual produk",
              filled: true,
              fillColor: Color(0xFFF1F4F8),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border focus
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Harap isi bidang ini!';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 14,
            ),
            cursorColor: Colors.red,
          ),
          SizedBox(height: 20),
          Text(
            'Diskon', // Add label for diskon
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: diskonController,
            decoration: InputDecoration(
              hintText: "Input diskon produk",
              filled: true,
              fillColor: Color(0xFFF1F4F8),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border focus
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Harap isi bidang ini!';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 14,
            ),
            cursorColor: Colors.red,
          ),
          SizedBox(height: 20),
          Text(
            'Masa Berlaku Diskon', // Add label for masa berlaku diskon
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: masaBerlakuDiskonController,
            decoration: InputDecoration(
              hintText: "Input masa berlaku diskon produk (hari)",
              filled: true,
              fillColor: Color(0xFFF1F4F8),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none, // Hapus border focus
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Harap isi bidang ini!';
              }
              return null;
            },
            style: TextStyle(
              fontSize: 14,
            ),
            cursorColor: Colors.red,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              primary: Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Update",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                //if id not null run add data to store data into firebase
                //else update data based on id
                if (widget.id == null) {
                  produk.add({
                    'nama_produk': nameController.text,
                    'kategori_produk': _selectedKategori,
                    'stok': stokController.text,
                    'harga_beli': hargabeliController.text,
                    'harga_jual': hargajualController.text,
                    'diskon': diskonController.text, // Save diskon value
                    'masa_berlaku_diskon': masaBerlakuDiskonController
                        .text, // Save masa berlaku diskon value
                  });
                } else {
                  produk.doc(widget.id).update({
                    'nama_produk': nameController.text,
                    'kategori_produk': _selectedKategori,
                    'stok': stokController.text,
                    'harga_beli': hargabeliController.text,
                    'harga_jual': hargajualController.text,
                    'diskon': diskonController.text, // Update diskon value
                    'masa_berlaku_diskon': masaBerlakuDiskonController
                        .text, // Update masa berlaku diskon value
                  });
                }
                //snackbar notification
                final snackBar =
                    SnackBar(content: Text('Data updated successfully!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                //back to main page
                //home page => '/'
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //     '/', (Route<dynamic> route) => false);
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => ListBarangWidget()),
                // );
                Navigator.of(context).pop();
              }
            },
          )
        ]),
      ),
    );
  }
}
