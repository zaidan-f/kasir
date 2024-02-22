import 'package:flutter/material.dart';
import 'tambahcus.dart';
import 'home_roma.dart';

// class Pelanggan extends StatelessWidget {
//   // const Profile({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF1F4F8),
//       body: ListView(
//         children: [
//           Container(
//             height: 200,
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: AlignmentDirectional(-1, 1),
//                   child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 16),
//                       child: Container(
//                         width: 90,
//                         height: 90,
//                       )),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(24, 16, 0, 0),
//             child: Text(
//               'Pengaturan Aplikasi',
//               style: TextStyle(
//                 fontSize: 14,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//             child: InkWell(
//               onTap: () {
//                 // Tindakan yang ingin dilakukan saat container dipencet
//                 print('Container Ditekan!');
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 3,
//                       color: Color(0x33000000),
//                       offset: Offset(0, 1),
//                     )
//                   ],
//                   borderRadius: BorderRadius.circular(8),
//                   shape: BoxShape.rectangle,
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(12),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                         child: Text(
//                           'sugeng',
//                           style: TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Align(
//                           alignment: AlignmentDirectional(0.9, 0),
//                           child: Icon(
//                             Icons.arrow_forward_ios,
//                             color: Color(0xFF57636C),
//                             size: 18,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           ////////////////////// tambahin button logout
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Tambahcus()),
//           );
//         },
//         child: Icon(Icons.add),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

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

// class Pelanggan extends StatefulWidget {
//   @override
//   State<Pelanggan> createState() => _MyAppState();
// }

// class _MyAppState extends State<Pelanggan> {
//   @override
//   Widget build(BuildContext context) {
//     //The entry point for accessing a [FirebaseFirestore].
//     FirebaseFirestore firebase = FirebaseFirestore.instance;

//     //get collection from firebase, collection is table in mysql
//     CollectionReference pelanggan = firebase.collection('pelanggan');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daftar pelanggan'),
//         backgroundColor: Color(0xFFc42e1d),
//       ),
//       body: FutureBuilder<QuerySnapshot>(
//         //data to be retrieved in the future
//         future: pelanggan.get(),
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
//                       return ListTile(
//                         leading: CircleAvatar(
//                           //get first character of name
//                           child: Text(
//                             alldata[index]['nama_pelanggan'][0],
//                             style: TextStyle(color: Colors.white), ),
//                           backgroundColor: Colors.red,
//                         ),
//                         title: Text(alldata[index]['nama_pelangan'],
//                             style: TextStyle(fontSize: 20)),
//                         subtitle: Text(alldata[index]['nomor_telepon'],
//                             style: TextStyle(fontSize: 16)),
//                         trailing: IconButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 //pass data to edit form
//                                 MaterialPageRoute(
//                                     builder: (context) => Tambahcus(
//                                           id: snapshot.data.docs[index].id,
//                                         )),
//                               );
//                             },
//                             icon: Icon(Icons.arrow_forward_rounded)),
//                       );
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
//             MaterialPageRoute(builder: (context) => Tambahcus()),
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

class Pelanggan extends StatefulWidget {
  @override
  State<Pelanggan> createState() => _PelangganState();
}

class _PelangganState extends State<Pelanggan> {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference pelanggan =
      FirebaseFirestore.instance.collection('pelanggan');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: pelanggan.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.data.docs.isEmpty) {
            return Center(child: Text('No Data'));
          }

          var customerList = snapshot.data.docs;

          customerList.sort((a, b) {
            var namaProdukA =
                a.data()['nama_pelanggan'].toString().toLowerCase();
            var namaProdukB =
                b.data()['nama_pelanggan'].toString().toLowerCase();
            return namaProdukA.compareTo(namaProdukB);
          });

          return ListView.builder(
            itemCount: customerList.length,
            itemBuilder: (context, index) {
              var data = customerList[index].data();

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
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text(
                      data['nama_pelanggan'][0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(data['nama_pelanggan'],
                      style: TextStyle(fontSize: 20)),
                  subtitle: Text(data['nomor_telepon'],
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
                              context, customerList[index].id);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _showDeleteConfirmationDialog(
                              context, customerList[index].id);
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
                'Detail Pelanggan',
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
              Text('Nama Pelanggan: \n ${data['nama_pelanggan']} \n'),
              Text('Nomor Telepon: \n ${data['nomor_telepon']} \n'),
              Text(
                getAddressString(data),
              ),
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
        builder: (context) => Tambahcus(id: customerId),
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
    pelanggan.doc(customerId).delete();
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

  var nameController = TextEditingController();
  var alamatController = TextEditingController();
  var kelurahanController = TextEditingController();
  var kecamatanController = TextEditingController();
  var kodeposController = TextEditingController();
  var kotaController = TextEditingController();
  var notlpController = TextEditingController();
  var provinsiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      getData();
    }
  }

  void getData() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('pelanggan')
        .doc(widget.id)
        .get();
    var data = snapshot.data();
    nameController.text = data['nama_pelanggan'];
    alamatController.text = data['alamat_jalan'];
    kelurahanController.text = data['alamat_kelurahandesa'];
    kecamatanController.text = data['alamat_kecamatan'];
    kodeposController.text = data['alamat_kodepos'];
    kotaController.text = data['alamat_kabupatenkota'];
    notlpController.text = data['nomor_telepon'];
    provinsiController.text = data['alamat_provinsi'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id != null ? 'Edit Pelanggan' : 'Tambah Pelanggan'),
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
                'Nama pelanggan', // Add label for masa berlaku diskon
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
                  hintText: "Input nama pelangan",
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
                'Nomor Telepon', // Add label for masa berlaku diskon
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
                  hintText: "Input nomor telepon",
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
                'Alamat jalan', // Add label for masa berlaku diskon
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
                  hintText: "Input alamat jalan",
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
                'Kelurahan', // Add label for masa berlaku diskon
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
                  hintText: "Input kelurahan",
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
                'Kecamatan', // Add label for masa berlaku diskon
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
                  hintText: "Input kecamatan",
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
                'Kota', // Add label for masa berlaku diskon
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
                  hintText: "Input kota",
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
                'Provinsi', // Add label for masa berlaku diskon
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
                  hintText: "Input provinsi",
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
                'Kode pos', // Add label for masa berlaku diskon
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
                  hintText: "Input kode pos",
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
                      FirebaseFirestore.instance.collection('pelanggan').add({
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
                      FirebaseFirestore.instance
                          .collection('pelanggan')
                          .doc(widget.id)
                          .update({
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
