import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'list_barang.dart';

class Tambahproduk extends StatefulWidget {
  //constructor have one parameter, optional paramter
  //if have id we will show data and run update method
  //else run add data
  const Tambahproduk({this.id});

  final String id;

  @override
  State<Tambahproduk> createState() => _TambahprodukState();
}

class _TambahprodukState extends State<Tambahproduk> {
  //set form key
  final _formKey = GlobalKey<FormState>();

  //set texteditingcontroller variable
  var nameController = TextEditingController();
  var deskripsiController = TextEditingController();
  // var stokController = TextEditingController();
  // var hargabeliController = TextEditingController();
  // var hargajualController = TextEditingController();
  // var diskonController = TextEditingController(); // Controller for diskon
  // var masaBerlakuDiskonController = TextEditingController(); // Controller for masa berlaku diskon

  //inisialize firebase instance
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference kategori;

  void getData() async {
    //get produk collection from firebase
    //collection is table in mysql
    kategori = firebase.collection('kategori');

    //if have id
    if (widget.id != null) {
      //get produk data based on id document
      var data = await kategori.doc(widget.id).get();

      //we get data.data()
      //so that it can be accessed, we make as a map
      var item = data.data() as Map<String, dynamic>;

      //set state to fill data controller from data firebase
      setState(() {
        nameController = TextEditingController(text: item['nama_kat']);
        deskripsiController = TextEditingController(text: item['deskripsi']);
        // stokController = TextEditingController(text: item['stok']);
        // hargabeliController = TextEditingController(text: item['harga_beli']);
        // hargajualController = TextEditingController(text: item['harga_jual']);
        // diskonController = TextEditingController(text: item['diskon'].toString()); // Fill diskon value if exists
        // masaBerlakuDiskonController = TextEditingController(text: item['masa_berlaku_diskon'].toString()); // Fill masa berlaku diskon value if exists
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Kategori"),
        backgroundColor: Colors.red,
        actions: [
          //if have data show delete button
          widget.id != null
              ? IconButton(
                  onPressed: () {
                    //method to delete data based on id
                    kategori.doc(widget.id).delete();

                    //back to main page
                    // '/' is home
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
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
            'Nama kategori',
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
              hintText: "Nama kategori",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red), // Ganti warna focus menjadi merah
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Harap isi bidang ini!';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Text(
            'Deskripsi kategori',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: deskripsiController,
            decoration: InputDecoration(
              hintText: "Kategori barang",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red), // Ganti warna focus menjadi merah
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Harap isi bidang ini!';
              }
              return null;
            },
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
                "Kirim",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                //if id not null run add data to store data into firebase
                //else update data based on id
                if (widget.id == null) {
                  kategori.add({
                    'nama_kat': nameController.text,
                    'deskripsi': deskripsiController.text,
                    // 'stok': stokController.text,
                    // 'harga_beli': hargabeliController.text,
                    // 'harga_jual': hargajualController.text,
                    // 'diskon': diskonController.text, // Save diskon value
                    // 'masa_berlaku_diskon': masaBerlakuDiskonController.text, // Save masa berlaku diskon value
                  });
                } else {
                  kategori.doc(widget.id).update({
                    'nama_kat': nameController.text,
                    'deskripsi': deskripsiController.text,
                    // 'stok': stokController.text,
                    // 'harga_beli': hargabeliController.text,
                    // 'harga_jual': hargajualController.text,
                    // 'diskon': diskonController.text, // Update diskon value
                    // 'masa_berlaku_diskon': masaBerlakuDiskonController.text, // Update masa berlaku diskon value
                  });
                }
                //snackbar notification
                final snackBar = SnackBar(content: Text('Data saved successfully!'));    
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                //back to main page
                //home page => '/'
                Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
              }
            },
          )
        ]),
      ),
    );
  }
}
