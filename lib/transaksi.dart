// import 'package:flutter/material.dart';
// import 'detail_transaksi.dart';
// import 'home_roma.dart';

// // class Transaksi extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Text('Tap Untuk ke Halaman Beranda'),
// //       // child: RaisedButton(
// //       //   onPressed: () {
// //       //     Route route = MaterialPageRoute(builder: (context) => BerandaPage());
// //       //     Navigator.push(context, route);
// //       //   },
// //       //   child: Text('Tap Untuk ke Halaman Beranda'),
// //       // ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class TransaksiDetailWidget extends StatefulWidget {
//   const TransaksiDetailWidget({Key key}) : super(key: key);

//   @override
//   State<TransaksiDetailWidget> createState() => _TransaksiDetailWidgetState();
// }

// class _TransaksiDetailWidgetState extends State<TransaksiDetailWidget> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (scaffoldKey.currentState.isDrawerOpen) {
//           scaffoldKey.currentState.openEndDrawer();
//         } else {
//           scaffoldKey.currentState.openDrawer();
//         }
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: Color(0xFFF1F4F8),
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_rounded,
//               color: Color(0xFF15161E),
//               size: 30,
//             ),
//             onPressed: () async {
//               Navigator.of(context).pop();
//             },
//           ),
//           actions: [
//             Padding(
//               padding: EdgeInsets.fromLTRB(0, 8, 12, 8),
//               child: IconButton(
//                 icon: Icon(
//                   Icons.more_vert_outlined,
//                   color: Color(0xFF15161E),
//                   size: 24,
//                 ),
//                 onPressed: () {
//                   print('IconButton pressed ...');
//                 },
//               ),
//             ),
//           ],
//           centerTitle: false,
//           elevation: 0,
//         ),
//         body: SafeArea(
//           top: true,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Align(
//                   alignment: Alignment(0, -1),
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(
//                         0,
//                         MediaQuery.of(context).size.width >= 1270.0
//                             ? 24.0
//                             : 0.0,
//                         0,
//                         0),
//                     child: Wrap(
//                       spacing: 16,
//                       runSpacing: 0,
//                       alignment: WrapAlignment.start,
//                       crossAxisAlignment: WrapCrossAlignment.start,
//                       direction: Axis.horizontal,
//                       runAlignment: WrapAlignment.start,
//                       verticalDirection: VerticalDirection.down,
//                       clipBehavior: Clip.none,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
//                           child: Container(
//                             width: double.infinity,
//                             constraints: BoxConstraints(
//                               maxWidth: 570,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   blurRadius: 3,
//                                   color: Color(0x33000000),
//                                   offset: Offset(0, 1),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.fromLTRB(16, 12, 16, 12),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.max,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'berhubung gweh gatau mau ngisi apa disini kalian nanti saran aja :)',
//                                           style: TextStyle(
//                                             fontFamily: 'Outfit',
//                                             color: Color(0xFF606A85),
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                         Divider(
//                                           thickness: 1,
//                                           color: Color(0xFFE5E7EB),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 4, 0, 0),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Transaction Number :',
//                                                 style: TextStyle(),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     0, 0, 90, 0),
//                                                 child: Text(
//                                                   'POS-404',
//                                                   style: TextStyle(),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 4, 0, 0),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Transaction Date       :',
//                                                 style: TextStyle(),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     0, 0, 90, 0),
//                                                 child: Text(
//                                                   '11-1-2024',
//                                                   style: TextStyle(),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 4, 0, 0),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Customer                   :',
//                                                 style: TextStyle(),
//                                               ),
//                                               Text(
//                                                 'Mamang racing',
//                                                 style: TextStyle(),
//                                               ),
//                                               IconButton(
//                                                 icon: Icon(
//                                                   Icons.add,
//                                                   size: 19,
//                                                 ),
//                                                 onPressed: () {
//                                                   print(
//                                                       'IconButton pressed ...');
//                                                 },
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         // New Row for Discounts
//                                         // Padding(
//                                         //   padding:
//                                         //       EdgeInsets.fromLTRB(0, 12, 0, 0),
//                                         //   child: Row(
//                                         //     mainAxisSize: MainAxisSize.max,
//                                         //     mainAxisAlignment:
//                                         //         MainAxisAlignment.spaceBetween,
//                                         //     children: [
//                                         //       Text(
//                                         //         'Discounts                   :',
//                                         //         style: TextStyle(),
//                                         //       ),
//                                         //       Text(
//                                         //         '10% off',
//                                         //         style: TextStyle(),
//                                         //       ),
//                                         //       IconButton(
//                                         //         icon: Icon(
//                                         //           Icons.remove,
//                                         //           size: 19,
//                                         //         ),
//                                         //         onPressed: () {
//                                         //           print('Remove discount ...');
//                                         //         },
//                                         //       ),
//                                         //     ],
//                                         //   ),
//                                         // ),
//                                         // End of Discounts Row
//                                         Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 12, 0, 0),
//                                           child: ElevatedButton(
//                                             onPressed: () {
//                                               Navigator.of(context).push(
//                                                 MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       DetailsTransaksiWidget(),
//                                                 ),
//                                               );
//                                             },
//                                             child: Text('Detail')
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           constraints: BoxConstraints(
//                             maxWidth: 500,
//                           ),
//                           decoration: BoxDecoration(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'detail_transaksi.dart';
// import 'home_roma.dart';

// // Import firebase dan flutterfire
// import 'package:cloud_firestore/cloud_firestore.dart';

// class TransaksiDetailWidget extends StatefulWidget {
//   const TransaksiDetailWidget({Key key}) : super(key: key);

//   @override
//   State<TransaksiDetailWidget> createState() => _TransaksiDetailWidgetState();
// }

// class _TransaksiDetailWidgetState extends State<TransaksiDetailWidget> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   // Variabel untuk menyimpan data pelanggan dari Firebase
//   List<String> pelangganList = [];
//   String selectedPelanggan;

//   // Method untuk mengambil data pelanggan dari Firebase
//   void getPelangganData() {
//     FirebaseFirestore.instance.collection('pelanggan').get().then((snapshot) {
//       setState(() {
//         pelangganList = snapshot.docs.map((DocumentSnapshot document) {
//           Map<String, dynamic> data = document.data();
//           String namaPelanggan = data['nama_pelanggan'];
//           String alamatJalan = data['alamat_jalan'];
//           String alamatKelurahanDesa = data['alamat_kelurahandesa'];
//           String alamatKecamatan = data['alamat_kecamatan'];
//           String alamatKodepos = data['alamat_kodepos'];
//           String alamatKabupatenKota = data['alamat_kabupatenkota'];
//           String nomorTelepon = data['nomor_telepon'];
//           String alamatProvinsi = data['alamat_provinsi'];
//           return '$namaPelanggan, $alamatJalan, $alamatKelurahanDesa, $alamatKecamatan, $alamatKodepos, $alamatKabupatenKota, $nomorTelepon, $alamatProvinsi';
//         }).toList();
//       });
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getPelangganData(); // Panggil method untuk mengambil data pelanggan saat widget diinisialisasi
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (scaffoldKey.currentState.isDrawerOpen) {
//           scaffoldKey.currentState.openEndDrawer();
//         } else {
//           scaffoldKey.currentState.openDrawer();
//         }
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: Color(0xFFF1F4F8),
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_rounded,
//               color: Color(0xFF15161E),
//               size: 30,
//             ),
//             onPressed: () async {
//               Navigator.of(context).pop();
//             },
//           ),
//           actions: [
//             Padding(
//               padding: EdgeInsets.fromLTRB(0, 8, 12, 8),
//               child: IconButton(
//                 icon: Icon(
//                   Icons.more_vert_outlined,
//                   color: Color(0xFF15161E),
//                   size: 24,
//                 ),
//                 onPressed: () {
//                   print('IconButton pressed ...');
//                 },
//               ),
//             ),
//           ],
//           centerTitle: false,
//           elevation: 0,
//         ),
//         body: SafeArea(
//           top: true,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Align(
//                   alignment: Alignment(0, -1),
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(
//                         0,
//                         MediaQuery.of(context).size.width >= 1270.0
//                             ? 24.0
//                             : 0.0,
//                         0,
//                         0),
//                     child: Wrap(
//                       spacing: 16,
//                       runSpacing: 0,
//                       alignment: WrapAlignment.start,
//                       crossAxisAlignment: WrapCrossAlignment.start,
//                       direction: Axis.horizontal,
//                       runAlignment: WrapAlignment.start,
//                       verticalDirection: VerticalDirection.down,
//                       clipBehavior: Clip.none,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
//                           child: Container(
//                             width: double.infinity,
//                             constraints: BoxConstraints(
//                               maxWidth: 570,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   blurRadius: 3,
//                                   color: Color(0x33000000),
//                                   offset: Offset(0, 1),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.fromLTRB(16, 12, 16, 12),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.max,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'berhubung gweh gatau mau ngisi apa disini kalian nanti saran aja :)',
//                                           style: TextStyle(
//                                             fontFamily: 'Outfit',
//                                             color: Color(0xFF606A85),
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                         Divider(
//                                           thickness: 1,
//                                           color: Color(0xFFE5E7EB),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 4, 0, 0),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Transaction Number :',
//                                                 style: TextStyle(),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     0, 0, 90, 0),
//                                                 child: Text(
//                                                   'POS-404',
//                                                   style: TextStyle(),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 4, 0, 0),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Transaction Date       :',
//                                                 style: TextStyle(),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     0, 0, 90, 0),
//                                                 child: Text(
//                                                   '11-1-2024',
//                                                   style: TextStyle(),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 4, 0, 0),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Customer                   :',
//                                                 style: TextStyle(),
//                                               ),
//                                               // Dropdown untuk memilih pelanggan
//                                               DropdownButton<String>(
//                                                 value: selectedPelanggan,
//                                                 onChanged: (String newValue) {
//                                                   setState(() {
//                                                     selectedPelanggan =
//                                                         newValue;
//                                                   });
//                                                 },
//                                                 items: pelangganList.map<
//                                                         DropdownMenuItem<
//                                                             String>>(
//                                                     (String value) {
//                                                   return DropdownMenuItem<
//                                                       String>(
//                                                     value: value,
//                                                     child: Text(value),
//                                                   );
//                                                 }).toList(),
//                                               ),
//                                               IconButton(
//                                                 icon: Icon(
//                                                   Icons.add,
//                                                   size: 19,
//                                                 ),
//                                                 onPressed: () {
//                                                   print(
//                                                       'IconButton pressed ...');
//                                                 },
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 12, 0, 0),
//                                           child: ElevatedButton(
//                                               onPressed: () {
//                                                 Navigator.of(context).push(
//                                                   MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         DetailsTransaksiWidget(),
//                                                   ),
//                                                 );
//                                               },
//                                               child: Text('Detail')),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           constraints: BoxConstraints(
//                             maxWidth: 500,
//                           ),
//                           decoration: BoxDecoration(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'cart_page.dart';
// import 'detail_transaksi.dart';
// import 'home_roma.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class TransaksiDetailWidget extends StatefulWidget {
//   const TransaksiDetailWidget({Key key}) : super(key: key);

//   @override
//   State<TransaksiDetailWidget> createState() => _TransaksiDetailWidgetState();
// }

// class _TransaksiDetailWidgetState extends State<TransaksiDetailWidget> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   List<String> pelangganList = [];
//   String selectedPelanggan;

//   void getPelangganData() {
//     FirebaseFirestore.instance.collection('pelanggan').get().then((snapshot) {
//       setState(() {
//         pelangganList = snapshot.docs.map((DocumentSnapshot document) {
//           Map<String, dynamic> data = document.data();
//           String namaPelanggan = data['nama_pelanggan'];
//           return namaPelanggan;
//         }).toList();
//       });
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getPelangganData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (scaffoldKey.currentState.isDrawerOpen) {
//           scaffoldKey.currentState.openEndDrawer();
//         } else {
//           scaffoldKey.currentState.openDrawer();
//         }
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: Color(0xFFF1F4F8),
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_rounded,
//               color: Color(0xFF15161E),
//               size: 30,
//             ),
//             onPressed: () async {
//               Navigator.of(context).pop();
//             },
//           ),
//           actions: [
//             Padding(
//               padding: EdgeInsets.fromLTRB(0, 8, 12, 8),
//               child: IconButton(
//                 icon: Icon(
//                   Icons.more_vert_outlined,
//                   color: Color(0xFF15161E),
//                   size: 24,
//                 ),
//                 onPressed: () {
//                   print('IconButton pressed ...');
//                 },
//               ),
//             ),
//           ],
//           centerTitle: false,
//           elevation: 0,
//         ),
//         body: SafeArea(
//           top: true,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Align(
//                   alignment: Alignment(0, -1),
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(
//                         0,
//                         MediaQuery.of(context).size.width >= 1270.0
//                             ? 24.0
//                             : 0.0,
//                         0,
//                         0),
//                     child: Wrap(
//                       spacing: 16,
//                       runSpacing: 0,
//                       alignment: WrapAlignment.start,
//                       crossAxisAlignment: WrapCrossAlignment.start,
//                       direction: Axis.horizontal,
//                       runAlignment: WrapAlignment.start,
//                       verticalDirection: VerticalDirection.down,
//                       clipBehavior: Clip.none,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
//                           child: Container(
//                             width: double.infinity,
//                             constraints: BoxConstraints(
//                               maxWidth: 570,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   blurRadius: 3,
//                                   color: Color(0x33000000),
//                                   offset: Offset(0, 1),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.fromLTRB(16, 12, 16, 12),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.max,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'berhubung gweh gatau mau ngisi apa disini kalian nanti saran aja :)',
//                                           style: TextStyle(
//                                             fontFamily: 'Outfit',
//                                             color: Color(0xFF606A85),
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                         Divider(
//                                           thickness: 1,
//                                           color: Color(0xFFE5E7EB),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 4, 0, 0),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Transaction Number :',
//                                                 style: TextStyle(),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     0, 0, 90, 0),
//                                                 child: Text(
//                                                   'POS-404',
//                                                   style: TextStyle(),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 4, 0, 0),
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Transaction Date       :',
//                                                 style: TextStyle(),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     0, 0, 90, 0),
//                                                 child: Text(
//                                                   '11-1-2024',
//                                                   style: TextStyle(),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
// Padding(
//   padding:
//       EdgeInsets.fromLTRB(0, 4, 0, 0),
//   child: Row(
//     mainAxisSize: MainAxisSize.max,
//     mainAxisAlignment:
//         MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         'Customer                   :',
//         style: TextStyle(),
//       ),
//       // Dropdown untuk memilih pelanggan
//       Expanded(
//         child: DropdownButton<String>(
//           value: selectedPelanggan,
//           onChanged: (String newValue) {
//             setState(() {
//               selectedPelanggan =
//                   newValue;
//             });
//           },
//           items: pelangganList.map<
//                   DropdownMenuItem<
//                       String>>(
//               (String value) {
//             return DropdownMenuItem<
//                 String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ),
//       ),
//     ],
//   ),
// ),
//                                         Padding(
//                                           padding:
//                                               EdgeInsets.fromLTRB(0, 12, 0, 0),
//                                           child: ElevatedButton(
//                                               onPressed: () {
//                                                 Navigator.of(context).push(
//                                                   MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         DetailsTransaksiWidget(),
//                                                   ),
//                                                 );
//                                               },
//                                               child: Text('Detail')),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         // Container(
//                         //   constraints: BoxConstraints(
//                         //     maxWidth: 500,
//                         //   ),
//                         //   decoration: BoxDecoration(),
//                         //   child: ItemList(),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// kode yang bener
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';

// class TransaksiDetailWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Cart(),
//       child: MaterialApp(
//         title: 'Shopping App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: HomePage(),
//         routes: {
//           '/cart': (context) =>
//               CartPage(), // Menetapkan rute untuk halaman keranjang
//         },
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Items'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart');
//             },
//           ),
//         ],
//       ),
//       body: ItemList(),
//     );
//   }
// }

// class ItemList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('produk').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return CircularProgressIndicator();
//         }
//         return ListView.builder(
//           itemCount: snapshot.data.docs.length,
//           itemBuilder: (context, index) {
//             DocumentSnapshot item = snapshot.data.docs[index];
//             return ListTile(
//               title: Text(item['nama_produk']),
//               subtitle: Text('\$${item['harga_jual']}'),
//               trailing: IconButton(
//                 icon: Icon(Icons.add),
//                 onPressed: () {
//                   Provider.of<Cart>(context, listen: false).addItem(item);
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class Cart extends ChangeNotifier {
//   List<DocumentSnapshot> _items = [];

//   List<DocumentSnapshot> get items => _items;

//   get quantity => null;

//   void addItem(DocumentSnapshot item) {
//     _items.add(item);
//     notifyListeners();
//   }

//   void removeItem(int index) {
//     _items.removeAt(index);
//     notifyListeners();
//   }
// }

// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   List<String> pelangganList = [];
//   String selectedPelanggan;

//   void getPelangganData() {
//     FirebaseFirestore.instance.collection('pelanggan').get().then((snapshot) {
//       setState(() {
//         pelangganList = snapshot.docs.map((DocumentSnapshot document) {
//           Map<String, dynamic> data = document.data();
//           String namaPelanggan = data['nama_pelanggan'];
//           String alamatJalan = data['alamat_jalan'];
//           // ... (sisa alamat data)
//           return '$namaPelanggan, $alamatJalan, ...';
//         }).toList();
//       });
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getPelangganData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Customer:',
//                   style: TextStyle(),
//                 ),
//                 Expanded(
//                   child: DropdownButton<String>(
//                     value: selectedPelanggan,
//                     onChanged: (String newValue) {
//                       setState(() {
//                         selectedPelanggan = newValue;
//                       });
//                     },
//                     items: pelangganList.map<DropdownMenuItem<String>>(
//                       (String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       },
//                     ).toList(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: cart.items.length,
//               itemBuilder: (context, index) {
//                 DocumentSnapshot item = cart.items[index];
//                 return ListTile(
//                   title: Text(item['nama_produk']),
//                   subtitle: Text('\$${item['harga_jual']}'),
//                   trailing: IconButton(
//                     icon: Icon(Icons.remove),
//                     onPressed: () {
//                       Provider.of<Cart>(context, listen: false).removeItem(index);
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// kode yang bnrrrrr
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';

// class TransaksiDetailWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Cart(),
//       child: MaterialApp(
//         title: 'Shopping App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: HomePage(),
//         routes: {
//           '/cart': (context) => CartPage(),
//           '/checkout': (context) => CheckoutPage(),
//         },
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Items'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart');
//             },
//           ),
//         ],
//       ),
//       body: ItemList(),
//     );
//   }
// }

// class ItemList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('produk').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return CircularProgressIndicator();
//         }
//         return ListView.builder(
//           itemCount: snapshot.data.docs.length,
//           itemBuilder: (context, index) {
//             DocumentSnapshot item = snapshot.data.docs[index];
//             return ListTile(
//               title: Text(item['nama_produk']),
//               subtitle: Text('\$${item['harga_jual']}'),
//               trailing: IconButton(
//                 icon: Icon(Icons.add),
//                 onPressed: () {
//                   Provider.of<Cart>(context, listen: false).addItem(item);
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class Cart extends ChangeNotifier {
//   List<Map<String, dynamic>> _items = [];

//   List<Map<String, dynamic>> get items => _items;

//   void addItem(DocumentSnapshot item) {
//     bool found = false;
//     for (var cartItem in _items) {
//       if (cartItem['id'] == item.id) {
//         cartItem['qty'] += 1;
//         found = true;
//         break;
//       }
//     }
//     if (!found) {
//       _items.add({
//         'id': item.id,
//         'nama_produk': item['nama_produk'],
//         'harga_jual': item['harga_jual'],
//         'qty': 1,
//       });
//     }
//     notifyListeners();
//   }

//   void removeItem(int index) {
//     _items.removeAt(index);
//     notifyListeners();
//   }

//   void clearCart() {
//     // Implementasi logika untuk membersihkan keranjang
//     _items.clear();
//     notifyListeners();
//   }
// }

// class CartPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: cart.items.length,
//         itemBuilder: (context, index) {
//           final item = cart.items[index];
//           return ListTile(
//             title: Text(item['nama_produk']),
//             subtitle: Row(
//               children: [
//                 Text('\$${item['harga_jual']}'),
//                 SizedBox(width: 10),
//                 Text('Qty: ${item['qty']}'),
//               ],
//             ),
//             trailing: IconButton(
//               icon: Icon(Icons.remove),
//               onPressed: () {
//                 Provider.of<Cart>(context, listen: false).removeItem(index);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// kode yang benr
// class CartPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: cart.items.length,
//         itemBuilder: (context, index) {
//           final item = cart.items[index];
//           return ListTile(
//             title: Text(item['nama_produk']),
//             subtitle: Row(
//               children: [
//                 Text('\$${item['harga_jual']}'),
//                 SizedBox(width: 10),
//                 Text('Qty: ${item['qty']}'),
//               ],
//             ),
//             trailing: IconButton(
//               icon: Icon(Icons.remove),
//               onPressed: () {
//                 Provider.of<Cart>(context, listen: false).removeItem(index);
//               },
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/checkout');
//                 },
//                 child: Text('Proceed to Checkout'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Provider.of<Cart>(context, listen: false).clearCart();
//                 },
//                 child: Text('Clear Cart'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CheckoutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);

//     // Calculate the total amount
//     double totalAmount = cart.items.fold(0, (sum, item) {
//       // Ensure item['harga_jual'] is treated as a numerical type (double)
//       double hargaJual = item['harga_jual'] is String
//           ? double.tryParse(item['harga_jual']) ?? 0
//           : (item['harga_jual'] ?? 0).toDouble();
//       return sum + (item['qty'] * hargaJual);
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//       ),
//       body: Column(
//         children: [
//           // Display selected items in the checkout
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: cart.items.length,
//             itemBuilder: (context, index) {
//               final item = cart.items[index];
//               return ListTile(
//                 title: Text(item['nama_produk']),
//                 subtitle: Row(
//                   children: [
//                     Text('\$${item['harga_jual']}'),
//                     SizedBox(width: 10),
//                     Text('Qty: ${item['qty']}'),
//                   ],
//                 ),
//               );
//             },
//           ),
//           // Display total amount
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}'),
//           ),
//           // Add additional widgets for shipping address, payment, etc.
//           // Add a button for completing the purchase
//           ElevatedButton(
//             onPressed: () {
//               // Implement logic for completing the purchase
//               // This can include navigating to a confirmation page or processing payment
//               // You may also want to update the database or perform other actions here
//               // For simplicity, clear the cart after completing the purchase
//               Provider.of<Cart>(context, listen: false).clearCart();
//               Navigator.pop(
//                   context); // Navigate back after completing the purchase
//             },
//             child: Text('Complete Purchase'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() {
//   runApp(TransaksiDetailWidget());
// }

// class TransaksiDetailWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Cart(),
//       child: MaterialApp(
//         title: 'Shopping App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: HomePage(),
//         routes: {
//           '/cart': (context) => CartPage(),
//           '/checkout': (context) => CheckoutPage(),
//         },
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Items'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               Navigator.pushNamed(context, '/cart');
//             },
//           ),
//         ],
//       ),
//       body: ItemList(),
//     );
//   }
// }

// class ItemList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('produk').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return CircularProgressIndicator();
//         }
//         return ListView.builder(
//           itemCount: snapshot.data.docs.length,
//           itemBuilder: (context, index) {
//             DocumentSnapshot item = snapshot.data.docs[index];
//             return ListTile(
//               title: Text(item['nama_produk']),
//               subtitle: Text('\$${item['harga_jual']}'),
//               trailing: IconButton(
//                 icon: Icon(Icons.add),
//                 onPressed: () {
//                   Provider.of<Cart>(context, listen: false).addItem(item);
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class Cart extends ChangeNotifier {
//   List<Map<String, dynamic>> _items = [];

//   List<Map<String, dynamic>> get items => _items;

//   void addItem(DocumentSnapshot item) {
//     bool found = false;
//     for (var cartItem in _items) {
//       if (cartItem['id'] == item.id) {
//         cartItem['qty'] += 1;
//         found = true;
//         break;
//       }
//     }
//     if (!found) {
//       _items.add({
//         'id': item.id,
//         'nama_produk': item['nama_produk'],
//         'harga_jual': item['harga_jual'],
//         'qty': 1,
//       });
//     }
//     notifyListeners();
//   }

//   void removeItem(int index) {
//     _items.removeAt(index);
//     notifyListeners();
//   }

//   void clearCart() {
//     _items.clear();
//     notifyListeners();
//   }
// }

// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   void initState() {
//     super.initState();
//     _saveCartItemsToFirestore();
//   }

//   Future<void> _saveCartItemsToFirestore() async {
//     final cart = Provider.of<Cart>(context, listen: false);
//     for (var item in cart.items) {
//       await FirebaseFirestore.instance.collection('keranjang').add({
//         'id': item['id'],
//         'nama_produk': item['nama_produk'],
//         'harga_jual': item['harga_jual'],
//         'qty': item['qty'],
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: cart.items.length,
//         itemBuilder: (context, index) {
//           final item = cart.items[index];
//           return ListTile(
//             title: Text(item['nama_produk']),
//             subtitle: Row(
//               children: [
//                 Text('\$${item['harga_jual']}'),
//                 SizedBox(width: 10),
//                 Text('Qty: ${item['qty']}'),
//               ],
//             ),
//             trailing: IconButton(
//               icon: Icon(Icons.remove),
//               onPressed: () {
//                 Provider.of<Cart>(context, listen: false).removeItem(index);
//               },
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/checkout');
//                 },
//                 child: Text('Proceed to Checkout'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Provider.of<Cart>(context, listen: false).clearCart();
//                 },
//                 child: Text('Clear Cart'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CheckoutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);

//     double totalAmount = cart.items.fold(0, (sum, item) {
//       double hargaJual = item['harga_jual'] is String
//           ? double.tryParse(item['harga_jual']) ?? 0
//           : (item['harga_jual'] ?? 0).toDouble();
//       return sum + (item['qty'] * hargaJual);
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//       ),
//       body: Column(
//         children: [
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: cart.items.length,
//             itemBuilder: (context, index) {
//               final item = cart.items[index];
//               return ListTile(
//                 title: Text(item['nama_produk']),
//                 subtitle: Row(
//                   children: [
//                     Text('\$${item['harga_jual']}'),
//                     SizedBox(width: 10),
//                     Text('Qty: ${item['qty']}'),
//                   ],
//                 ),
//               );
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Provider.of<Cart>(context, listen: false).clearCart();
//               Navigator.pop(context);
//             },
//             child: Text('Complete Purchase'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(TransaksiDetailWidget());
}

class TransaksiDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: ItemList(),
    );
  }
}

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('produk').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot item = snapshot.data.docs[index];
            return ListTile(
              title: Text(item['nama_produk']),
              subtitle: Text('\$${item['harga_jual']}'),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Provider.of<Cart>(context, listen: false).addItem(item);
                },
              ),
            );
          },
        );
      },
    );
  }
}

class Cart extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem(DocumentSnapshot item) {
    bool found = false;
    for (var cartItem in _items) {
      if (cartItem['id'] == item.id) {
        cartItem['qty'] += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      _items.add({
        'id': item.id,
        'nama_produk': item['nama_produk'],
        'harga_jual': item['harga_jual'],
        'qty': 1,
      });
    }
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    for (var item in _items) {
      _removeItemFromFirestore(item['id']);
    }
    _items.clear();
    notifyListeners();
  }

  Future<void> _removeItemFromFirestore(String itemId) async {
    await FirebaseFirestore.instance
        .collection('keranjang')
        .doc(itemId)
        .delete();
  }
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    _saveCartItemsToFirestore();
  }

  Future<void> _saveCartItemsToFirestore() async {
    final cart = Provider.of<Cart>(context, listen: false);
    for (var item in cart.items) {
      await FirebaseFirestore.instance.collection('keranjang').add({
        'id': item['id'],
        'nama_produk': item['nama_produk'],
        'harga_jual': item['harga_jual'],
        'qty': item['qty'],
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item['nama_produk']),
            subtitle: Row(
              children: [
                Text('\$${item['harga_jual']}'),
                SizedBox(width: 10),
                Text('Qty: ${item['qty']}'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                Provider.of<Cart>(context, listen: false).removeItem(index);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Text('Proceed to Checkout'),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<Cart>(context, listen: false).clearCart();
                },
                child: Text('Clear Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    double totalAmount = cart.items.fold(0, (sum, item) {
      double hargaJual = item['harga_jual'] is String
          ? double.tryParse(item['harga_jual']) ?? 0
          : (item['harga_jual'] ?? 0).toDouble();
      return sum + (item['qty'] * hargaJual);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return ListTile(
                title: Text(item['nama_produk']),
                subtitle: Row(
                  children: [
                    Text('\$${item['harga_jual']}'),
                    SizedBox(width: 10),
                    Text('Qty: ${item['qty']}'),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}'),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<Cart>(context, listen: false).clearCart();
              Navigator.pop(context);
            },
            child: Text('Complete Purchase'),
          ),
        ],
      ),
    );
  }
}
