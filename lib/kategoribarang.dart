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

class Kategoribarang extends StatelessWidget {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference kategori = FirebaseFirestore.instance.collection('kategori');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Kategori Barang'),
        backgroundColor: Colors.red,
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
                  title: Text(data['nama_kat'], style: TextStyle(fontSize: 20)),
                  subtitle: Text(
                    data['deskripsi'],
                    style: TextStyle(fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
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

  Future<void> _showDetailPopUp(BuildContext context, Map<String, dynamic> data) async {
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
                'Detail Kategori',
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
}
