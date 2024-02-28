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

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                  trailing: IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      _showDetailPopUp(context, data);
                    },
                  ),
                ),
              );
            },
          );
        },
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
              ),
              SizedBox(width: 8),
              Text(
                'Detail Pelanggan',
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
}

class Tambahcus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Pelanggan'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
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
            // Tambah field input nama pelanggan
            TextFormField(
              decoration: InputDecoration(
                hintText: "Input nama pelanggan",
                filled: true,
                fillColor: Color(0xFFF1F4F8),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                primary: Colors.red,
              ),
              onPressed: () {
                // Implementasi simpan data ke Firestore
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Pelanggan(),
  ));
}
