import 'package:flutter/material.dart';
import 'detail_transaksi.dart';
import 'home_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profildetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 

class BerandaAdmin extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<int> _getTotalProducts() async {
    QuerySnapshot querySnapshot = await _firestore.collection('produk').get();
    return querySnapshot.size;
  }

  Future<int> _getTotalStores() async {
    QuerySnapshot querySnapshot = await _firestore.collection('toko').get();
    return querySnapshot.size;
  }

  Future<int> _getTotalCustomers() async {
    QuerySnapshot querySnapshot = await _firestore.collection('pelanggan').get();
    return querySnapshot.size;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF1F4F8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Selamat Datang Admin!',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x33000000),
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              color: Color(0xFF57636C),
                              size: 30,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Text(
                                    '${_auth.currentUser?.displayName ?? "Admin"}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Text(
                                    _auth.currentUser?.email ?? "",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Detailprofil(),
                                    ),
                                  );
                                },
                                child: Align(
                                  alignment: AlignmentDirectional(0.9, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF57636C),
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Color(0xFFADADAD),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.attach_money_sharp,
                            color: Color(0xFF57636C),
                            size: 30,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 10, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Omzet',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  'RP 100.000.000.000',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Color(0xFFADADAD),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Container(
                                  width: 100,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x33000000),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.analytics,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Text(
                                          'awikwoakokoakoke',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Container(
                                  width: 100,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Text(
                                          'Transaksi',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                  8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomCard(
                      title: 'Barang',
                      valueFuture: _getTotalProducts(),
                      isTitleBold: true,
                      color: Color(0xFFc42e1d),
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      title: 'Stok Barang',
                      value: '200',
                      isTitleBold: true,
                      color: Color(0xFFc42e1d),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                  8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomCard(
                      title: 'Customer',
                      valueFuture: _getTotalCustomers(),
                      isTitleBold: true,
                      color: Color(0xFFc42e1d),
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      title: 'Toko',
                      valueFuture: _getTotalStores(),
                      isTitleBold: true,
                      color: Color(0xFFc42e1d),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                  8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomCard(
                      title: '-------',
                      value: '125415',
                      isTitleBold: true,
                      color: Color(0xFFc42e1d),
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      title: 'Pendapatan',
                      value: '200',
                      isTitleBold: true,
                      color: Color(0xFFc42e1d),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String value;
  final Future<int> valueFuture;
  final bool isTitleBold;
  final Color color;
  final Color textColor;

  const CustomCard({
    this.title,
    this.value,
    this.valueFuture,
    this.isTitleBold = false,
    this.color = const Color(0xFFc42e1d),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: 170,
        height: 139,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 14,
                  fontWeight: isTitleBold ? FontWeight.bold : FontWeight.normal,
                  color: textColor,
                ),
              ),
            ),
            valueFuture != null
                ? FutureBuilder<int>(
                    future: valueFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${snapshot.data}',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 40,
                                fontWeight: FontWeight.normal,
                                color: textColor,
                              ),
                            ),
                          );
                        }
                      }
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                        color: textColor,
                      ),
                    ),
                  ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsTransaksiWidget(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFc42e1d),
                  ),
                  child: Text('Lihat Detail'),
                ),
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
    home: BerandaAdmin(),
  ));
}
