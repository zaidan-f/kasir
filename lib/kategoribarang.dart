import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'tambah_kategori.dart';

// void main() async {
//   //do initialization to use firebase
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(
//     MaterialApp(
//       //remove the debug banner
//       debugShowCheckedModeBanner: false,
//       title: "Flutter Contact Firebase",
//       home: MyApp()
//     )
//   );
// }

class Kategoribarang extends StatefulWidget {
  @override
  State<Kategoribarang> createState() => _MyAppState();
}

class _MyAppState extends State<Kategoribarang> {
  @override
  Widget build(BuildContext context) {
    //The entry point for accessing a [FirebaseFirestore].
    FirebaseFirestore firebase = FirebaseFirestore.instance;

    //get collection from firebase, collection is table in mysql
    CollectionReference kategori = firebase.collection('kategori');

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kategori'),
        backgroundColor: Color(0xFFc42e1d),
      ),
      body: FutureBuilder<QuerySnapshot>(
        //data to be retrieved in the future
        future: kategori.get(),
        builder: (_, snapshot) {
          //show if there is data
          if (snapshot.hasData) {
            // we take the document and pass it to a variable
            var alldata = snapshot.data.docs;

            //if there is data, make list
            return alldata.length != 0
                ? ListView.builder(

                    // displayed as much as the variable data alldata
                    itemCount: alldata.length,

                    //make custom item with list tile.
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          //get first character of name
                          child: Text(
                            alldata[index]['nama_kat'][0],
                            style: TextStyle(color: Colors.white), ),
                          backgroundColor: Colors.red,
                        ),
                        title: Text(alldata[index]['nama_kat'],
                            style: TextStyle(fontSize: 20)),
                        subtitle: Text(alldata[index]['deskripsi'],
                            style: TextStyle(fontSize: 16)),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                //pass data to edit form
                                MaterialPageRoute(
                                    builder: (context) => Tambahproduk(
                                          id: snapshot.data.docs[index].id,
                                        )),
                              );
                            },
                            icon: Icon(Icons.arrow_forward_rounded)),
                      );
                    })
                : Center(
                    child: Text(
                      'No Data',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
          } else {
            return Center(child: Text("Loading...."));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Tambahproduk()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
