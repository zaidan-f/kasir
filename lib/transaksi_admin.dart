// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Toko',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HalamanToko(),
//     );
//   }
// }

// class HalamanToko extends StatefulWidget {
//   @override
//   _HalamanTokoState createState() => _HalamanTokoState();
// }

// class _HalamanTokoState extends State<HalamanToko> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Toko List'),
//       // ),
//       body: StreamBuilder(
//         stream: _firestore.collection('toko').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data.docs.length,
//               itemBuilder: (BuildContext context, int index) {
//                 DocumentSnapshot document = snapshot.data.docs[index];
//                 Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//                 String namaToko = data['nama_toko'];
//                 String telepon = data['telepon'];
//                 return ListTile(
//                   title: Text(namaToko),
//                   subtitle: Text(telepon),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HalamanToko extends StatefulWidget {
  @override
  State<HalamanToko> createState() => _HalamanTokoState();
}

class _HalamanTokoState extends State<HalamanToko> {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference toko =
      FirebaseFirestore.instance.collection('toko'); // Mengambil koleksi 'toko'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: toko.snapshots(), // Menggunakan stream dari koleksi 'toko'
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.data.docs.isEmpty) {
            return Center(child: Text('No Data'));
          }

          var tokoList = snapshot.data.docs;

          tokoList.sort((a, b) {
            var namaTokoA =
                a.data()['nama_toko'].toString().toLowerCase();
            var namaTokoB =
                b.data()['nama_toko'].toString().toLowerCase();
            return namaTokoA.compareTo(namaTokoB);
          });

          return ListView.builder(
            itemCount: tokoList.length,
            itemBuilder: (context, index) {
              var data = tokoList[index].data();

              return Container(
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text(
                      data['nama_toko'][0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(data['nama_toko'],
                      style: TextStyle(fontSize: 20)),
                  subtitle: Text(data['telepon'],
                      style: TextStyle(fontSize: 16)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          _showDetailPopUp(context, data);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _navigateToUpdateForm(
                              context, tokoList[index].id);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _showDeleteConfirmationDialog(
                              context, tokoList[index].id);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Tambahcus()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }

  String getAddressString(Map<String, dynamic> data) {
    String alamat = data['alamat_jalan'] ?? 'No alamat';
    String kelurahan = data['alamat_kelurahandesa'] ?? 'No kelurahan';
    String kecamatan = data['alamat_kecamatan'] ?? 'No kecamatan';
    String kota = data['alamat_kabupatenkota'] ?? 'No kota';
    String provinsi = data['alamat_provinsi'] ?? 'No provinsi';
    String kodepos = data['alamat_kodepos'] ?? 'No kodepos';

    return 'Alamat : $alamat, $kelurahan, Kec.$kecamatan, Kota $kota, $provinsi $kodepos';
  }

  // Fungsi untuk menampilkan pop-up detail produk
  Future<void> _showDetailPopUp(
      BuildContext context, Map<String, dynamic> data) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.info,
                // color: Colors.red, // Warna ikon
              ),
              SizedBox(width: 8), // Jarak antara ikon dan teks
              Text(
                'Detail Toko',
                style: TextStyle(
                    // color: Colors.red, // Warna teks
                    ),
              ),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nama Toko: \n ${data['nama_toko']} \n'),
              Text('Telepon: \n ${data['telepon']} \n'),
              // Text(
              //   getAddressString(data),
              // ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Tutup',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _navigateToUpdateForm(BuildContext context, String tokoId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tambahcus(id: tokoId),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String tokoId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Konfirmasi Hapus',
            style: TextStyle(
              color: Colors.red, // Warna teks
            ),
          ),
          content: Text('Apakah Anda yakin ingin menghapus produk ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Batal',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _deleteProduct(tokoId);
                Navigator.of(context).pop();
              },
              child: Text(
                'Hapus',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _deleteProduct(String tokoId) {
    toko.doc(tokoId).delete();
  }
}

class Tambahcus extends StatefulWidget {
  final String id;

  const Tambahcus({Key key, this.id}) : super(key: key);

  @override
  _TambahcusState createState() => _TambahcusState();
}

class _TambahcusState extends State<Tambahcus> {
  final _formKey = GlobalKey<FormState>();

  var namaTokoController = TextEditingController();
  var teleponController = TextEditingController();
  var alamatTokoController = TextEditingController();
  var deskripsiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      _getData();
    }
  }

  void _getData() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('toko')
        .doc(widget.id)
        .get();
    var data = snapshot.data();
    namaTokoController.text = data['nama_toko'];
    teleponController.text = data['telepon'];
    alamatTokoController.text = data['alamat_toko'];
    deskripsiController.text = data['deskripsi_toko'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id != null ? 'Edit Toko' : 'Tambah Toko'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama Toko'),
              TextFormField(
                controller: namaTokoController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama Toko',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nama toko tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('Nomor Telepon'),
              TextFormField(
                controller: teleponController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nomor Telepon',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nomor telepon tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('Alamat Toko'),
              TextFormField(
                controller: alamatTokoController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Alamat Toko',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text('Deskripsi Toko'),
              TextFormField(
                controller: deskripsiController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Deskripsi Toko',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Deskripsi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    if (widget.id == null) {
                      FirebaseFirestore.instance.collection('toko').add({
                        'nama_toko': namaTokoController.text,
                        'telepon': teleponController.text,
                        'alamat_toko': alamatTokoController.text,
                        'deskripsi_toko': deskripsiController.text,
                      });
                    } else {
                      FirebaseFirestore.instance
                          .collection('toko')
                          .doc(widget.id)
                          .update({
                        'nama_toko': namaTokoController.text,
                        'telepon': teleponController.text,
                        'alamat_toko': alamatTokoController.text,
                        'deskripsi_toko': deskripsiController.text,
                      });
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Data saved successfully!')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.id != null ? 'Update' : 'Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}