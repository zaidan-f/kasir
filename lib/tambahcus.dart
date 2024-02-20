import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'list_barang.dart';

class Tambahcus extends StatefulWidget {
  //constructor have one parameter, optional paramter
  //if have id we will show data and run update method
  //else run add data
  const Tambahcus({this.id});

  final String id;

  @override
  State<Tambahcus> createState() => _TambahcusState();
}

class _TambahcusState extends State<Tambahcus> {
  //set form key
  final _formKey = GlobalKey<FormState>();

  //set texteditingcontroller variable
  var nameController = TextEditingController();
  var alamatController = TextEditingController();
  var kelurahanController = TextEditingController();
  var kecamatanController = TextEditingController();
  var kodeposController = TextEditingController();
  var kotaController = TextEditingController();
  var notlpController = TextEditingController();
  var provinsiController = TextEditingController();

  //inisialize firebase instance
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference pelanggan;

  void getData() async {
    //get produk collection from firebase
    //collection is table in mysql
    pelanggan = firebase.collection('pelanggan');

    //if have id
    if (widget.id != null) {
      //get produk data based on id document
      var data = await pelanggan.doc(widget.id).get();

      //we get data.data()
      //so that it can be accessed, we make as a map
      var item = data.data() as Map<String, dynamic>;

      //set state to fill data controller from data firebase
      setState(() {
        nameController = TextEditingController(text: item['nama_pelanggan']);
        alamatController = TextEditingController(text: item['alamat_jalan']);
        kelurahanController =
            TextEditingController(text: item['alamat_kelurahandesa']);
        kecamatanController =
            TextEditingController(text: item['alamat_kecamatan']);
        kodeposController = TextEditingController(text: item['alamat_kodepos']);
        kotaController =
            TextEditingController(text: item['alamat_kabupatenkota']);
        notlpController = TextEditingController(text: item['nomor_telepon']);
        provinsiController =
            TextEditingController(text: item['alamat_provinsi']);
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
        title: Text("Tambah pelanggan"),
        backgroundColor: Colors.red,
        actions: [
          //if have data show delete button
          widget.id != null
              ? IconButton(
                  onPressed: () {
                    //method to delete data based on id
                    pelanggan.doc(widget.id).delete();

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
            'Nama pelanggan',
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
              hintText: "Nama pelanggan",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red), // Ganti warna focus menjadi merah
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
            'Nomor Telepon',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: notlpController,
            decoration: InputDecoration(
              hintText: "input nomor telepon",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red), // Ganti warna focus menjadi merah
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
          Text(
            'Alamat Jalan',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: alamatController,
            decoration: InputDecoration(
              hintText: "pelanggan barang",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red), // Ganti warna focus menjadi merah
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
          Text(
            'Kelurahan',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: kelurahanController,
            decoration: InputDecoration(
              hintText: "pelanggan barang",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red), // Ganti warna focus menjadi merah
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
          Text(
            'Deskripsi kecamtan',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: kecamatanController,
            decoration: InputDecoration(
              hintText: "pelanggan barang",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red), // Ganti warna focus menjadi merah
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
          Text(
            'kota pelanggan',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: kotaController,
            decoration: InputDecoration(
              hintText: "pelanggan barang",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red), // Ganti warna focus menjadi merah
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
          Text(
            'profinsi pelanggan',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: provinsiController,
            decoration: InputDecoration(
              hintText: "pelanggan barang",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red), // Ganti warna focus menjadi merah
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
          Text(
            'kodepos pelanggan',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: kodeposController,
            decoration: InputDecoration(
              hintText: "pelanggan barang",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red), // Ganti warna focus menjadi merah
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
                  pelanggan.add({
                    'nama_pelanggan': nameController.text,
                    'alamat_jalan': alamatController.text,
                    'alamat_kelurahandesa': kelurahanController.text,
                    'alamat_kecamatan': kecamatanController.text,
                    'alamat_kodepos': kodeposController.text,
                    'alamat_kabupatenkota': kotaController.text,
                    'nomor_telepon': notlpController.text,
                    'alamat_provinsi': provinsiController.text,
                  });
                } else {
                  pelanggan.doc(widget.id).update({
                    'nama_pelanggan': nameController.text,
                    'alamat_jalan': alamatController.text,
                    'alamat_kelurahandesa': kelurahanController.text,
                    'alamat_kecamatan': kecamatanController.text,
                    'alamat_kodepos': kodeposController.text,
                    'alamat_kabupatenkota': kotaController.text,
                    'nomor_telepon': notlpController.text,
                    'alamat_provinsi': provinsiController.text,
                  });
                }
                //snackbar notificationZ
                final snackBar =
                    SnackBar(content: Text('Data saved successfully!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                //back to main page
                //home page => '/'
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/', (Route<dynamic> route) => false);
              }
            },
          )
        ]),
      ),
    );
  }
}
