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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar pelanggan'),
        backgroundColor: Color(0xFFc42e1d),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('pelanggan').snapshots(),
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
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data.docs[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    data['nama_pelanggan'][0],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(data['nama_pelanggan'],
                    style: TextStyle(fontSize: 20)),
                subtitle:
                    Text(data['nomor_telepon'], style: TextStyle(fontSize: 16)),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Tambahcus(id: data.id)),
                    );
                  },
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
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama Pelanggan'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Harap isi bidang ini!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: alamatController,
                decoration: InputDecoration(labelText: 'Alamat Jalan'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Harap isi bidang ini!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: kelurahanController,
                decoration: InputDecoration(labelText: 'Kelurahan'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Harap isi bidang ini!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: kecamatanController,
                decoration: InputDecoration(labelText: 'Deskripsi Kecamatan'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Harap isi bidang ini!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: kodeposController,
                decoration: InputDecoration(labelText: 'Kodepos Pelanggan'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Harap isi bidang ini!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: kotaController,
                decoration: InputDecoration(labelText: 'Kota Pelanggan'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Harap isi bidang ini!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: notlpController,
                decoration: InputDecoration(labelText: 'Nomor Telepon'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Harap isi bidang ini!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: provinsiController,
                decoration: InputDecoration(labelText: 'Provinsi Pelanggan'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Harap isi bidang ini!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
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
                child: Text(widget.id != null ? 'Update' : 'Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
