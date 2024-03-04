// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'tambah_kategori.dart';

// // void main() async {
// //   //do initialization to use firebase
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();

// //   runApp(
// //     MaterialApp(
// //       //remove the debug banner
// //       debugShowCheckedModeBanner: false,
// //       title: "Flutter Contact Firebase",
// //       home: MyApp()
// //     )
// //   );
// // }

// class Kategoribarang extends StatefulWidget {
//   @override
//   State<Kategoribarang> createState() => _MyAppState();
// }

// class _MyAppState extends State<Kategoribarang> {
//   @override
//   Widget build(BuildContext context) {
//     //The entry point for accessing a [FirebaseFirestore].
//     FirebaseFirestore firebase = FirebaseFirestore.instance;

//     //get collection from firebase, collection is table in mysql
//     CollectionReference kategori = firebase.collection('kategori');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daftar Kategori'),
//         backgroundColor: Color(0xFFc42e1d),
//       ),
//       body: FutureBuilder<QuerySnapshot>(
//         //data to be retrieved in the future
//         future: kategori.get(),
//         builder: (_, snapshot) {
//           //show if there is data
//           if (snapshot.hasData) {
//             // we take the document and pass it to a variable
//             var alldata = snapshot.data.docs;

//             //if there is data, make list
//             return alldata.length != 0
//                 ? ListView.builder(

//                     // displayed as much as the variable data alldata
//                     itemCount: alldata.length,

//                     //make custom item with list tile.
//                     itemBuilder: (_, index) {
//                       return Container(
//                 margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.red,
//                     child: Text(
//                       alldata['nama_kat'][0],
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   title: Text(alldata['nama_kat'],
//                       style: TextStyle(fontSize: 20)),
//                   subtitle: Text(alldata['deskripsi'],
//                       style: TextStyle(fontSize: 16)),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.info),
//                         onPressed: () {
//                           _showDetailPopUp(context, alldata);
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: () {
//                           _navigateToUpdateForm(
//                               context, kategoriList[index].id);
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () {
//                           _showDeleteConfirmationDialog(
//                               context, kategoriList[index].id);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//                     })
//                 : Center(
//                     child: Text(
//                       'No Data',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   );
//           } else {
//             return Center(child: Text("Loading...."));
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Tambahproduk()),
//           );
//         },
//         child: Icon(Icons.add),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KategoribarangAdmin extends StatefulWidget {
  @override
  State<KategoribarangAdmin> createState() => _KategoribarangAdminState();
}

class _KategoribarangAdminState extends State<KategoribarangAdmin> {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference kategori =
      FirebaseFirestore.instance.collection('kategori');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Ikon kembali
          onPressed: () {
            Navigator.pop(context); // Fungsi untuk kembali
          },
        ),
        title: Text('Kategori Barang'), // Judul AppBar
        backgroundColor: Colors.red, // Warna latar belakang AppBar
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: kategori.snapshots(),
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

          var kategoriList = snapshot.data.docs;

          kategoriList.sort((a, b) {
            var namaProdukA = a.data()['nama_kat'].toString().toLowerCase();
            var namaProdukB = b.data()['nama_kat'].toString().toLowerCase();
            return namaProdukA.compareTo(namaProdukB);
          });

          return ListView.builder(
            itemCount: kategoriList.length,
            itemBuilder: (context, index) {
              var data = kategoriList[index].data();

              // var data = snapshot.data.docs[index];
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
                  // leading: CircleAvatar(
                  //   backgroundColor: Colors.red,
                  //   child: Text(
                  //     data['nama_kat'][0],
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                  title: Text(data['nama_kat'], style: TextStyle(fontSize: 20)),
                  subtitle: Text(
                    data['deskripsi'],
                    style: TextStyle(fontSize: 16),
                    maxLines: 1, // Batasi ke satu baris
                    overflow: TextOverflow
                        .ellipsis, // Tampilkan '...' jika melebihi batas
                  ),
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
                              context, kategoriList[index].id);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _showDeleteConfirmationDialog(
                              context, kategoriList[index].id);
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
            MaterialPageRoute(builder: (context) => Tambahkat()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
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
                'Detail Kategori',
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
              Text('Nama Kategori: \n ${data['nama_kat']} \n'),
              Text('Deskripsi: \n${data['deskripsi']} \n'),
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

  void _navigateToUpdateForm(BuildContext context, String customerId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tambahkat(id: customerId),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String customerId) {
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
          content: Text('Apakah Anda yakin ingin menghapus kategori ini?'),
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
                _deleteProduct(customerId);
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

  void _deleteProduct(String customerId) {
    kategori.doc(customerId).delete();
  }
}

class Tambahkat extends StatefulWidget {
  final String id;

  const Tambahkat({Key key, this.id}) : super(key: key);

  @override
  _TambahkatState createState() => _TambahkatState();
}

class _TambahkatState extends State<Tambahkat> {
  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var deskripsiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      getData();
    }
  }

  void getData() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('kategori')
        .doc(widget.id)
        .get();
    var data = snapshot.data();
    nameController.text = data['nama_kat'];
    deskripsiController.text = data['deskripsi'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id != null ? 'Edit Kategori' : 'Tambah Kategori'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 10),
              Text(
                'Nama Kategori', // Add label for masa berlaku diskon
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
                  hintText: "Input nama kategori",
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
              SizedBox(height: 10),
              Text(
                'Deskripsi', // Add label for masa berlaku diskon
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
                  hintText: "Input deskripsi kategori",
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
                  child: Text(widget.id != null ? 'Update' : 'Simpan'),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    if (widget.id == null) {
                      FirebaseFirestore.instance.collection('kategori').add({
                        'nama_kat': nameController.text,
                        'deskripsi': deskripsiController.text,
                      });
                    } else {
                      FirebaseFirestore.instance
                          .collection('kategori')
                          .doc(widget.id)
                          .update({
                        'nama_kat': nameController.text,
                        'deskripsi': deskripsiController.text,
                      });
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Data saved successfully!')),
                    );
                    Navigator.pop(context);
                  }
                },
                // child: Text(widget.id != null ? 'Update' : 'Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
