// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class TransaksiList extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Transaksi'),
//       ),
//       body: FutureBuilder(
//         future: getCurrentUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else {
//             String currentUserId = snapshot.data.uid;
//             return StreamBuilder(
//               stream: _firestore
//                   .collection('header_transaksi')
//                   .where('id_kasir', isEqualTo: currentUserId)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 } else {
//                   var transaksiDocuments = snapshot.data.docs;
//                   return ListView.builder(
//                     itemCount: transaksiDocuments.length,
//                     itemBuilder: (context, index) {
//                       var transaksi = transaksiDocuments[index].data();
//                       // Tampilkan informasi transaksi sesuai kebutuhan
//                       return ListTile(
//                         title: Text('Tanggal: ${transaksi['tanggal_transaksi']}, id kasir: ${transaksi['id_kasir']}'),
//                         subtitle: Text('Total Harga: ${transaksi['total_harga']}'),
//                       );
//                     },
//                   );
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future<User> getCurrentUser() async {
//     User user = await _auth.currentUser;
//     return user;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class TransaksiList extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Transaksi'),
//       ),
//       body: FutureBuilder(
//         future: getCurrentUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else {
//             String currentUserId = snapshot.data.uid;
//             return StreamBuilder(
//               stream: _firestore
//                   .collection('header_transaksi')
//                   .where('id_kasir', isEqualTo: currentUserId)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 } else {
//                   var transaksiDocuments = snapshot.data.docs;
//                   // Create a Map to group transactions by month and year
//                   Map<String, List<Map<String, dynamic>>> groupedTransactions =
//                       {};

//                   transaksiDocuments.forEach((transactionDoc) {
//                     var transaksi = transactionDoc.data();
//                     // Extract month and year from the transaction date
//                     DateTime tanggalTransaksi =
//                         transaksi['tanggal_transaksi'].toDate();
//                     String monthYear =
//                         "${tanggalTransaksi.month}-${tanggalTransaksi.year}";

//                     // Add transaction to the corresponding group
//                     groupedTransactions.putIfAbsent(monthYear, () => []);
//                     groupedTransactions[monthYear].add(transaksi);
//                   });

//                   // Display transactions grouped by month and year
//                   return ListView.builder(
//                     itemCount: groupedTransactions.length,
//                     itemBuilder: (context, index) {
//                       var monthYear = groupedTransactions.keys.elementAt(index);
//                       var transactions = groupedTransactions[monthYear];

//                       // Calculate total harga for the month
//                       // int totalHarga = 0;
//                       // transactions.forEach((transaction) {
//                       //   // Ensure 'total_harga' is not null
//                       //   if (transaction['total_harga'] != null) {
//                       //     // Add 'total_harga' to the total
//                       //     totalHarga += transaction['total_harga'];
//                       //   }
//                       // });

//                       return ListTile(
//                         title: Text('Bulan & Tahun: $monthYear'),
//                         // subtitle: Text('Total Harga: $totalHarga'),
//                       );
//                     },
//                   );
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future<User> getCurrentUser() async {
//     User user = await _auth.currentUser;
//     return user;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class TransaksiList extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Transaksi'),
//       ),
//       body: FutureBuilder(
//         future: getCurrentUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else {
//             String currentUserId = snapshot.data.uid;
//             return StreamBuilder(
//               stream: _firestore
//                   .collection('header_transaksi')
//                   .where('id_kasir', isEqualTo: currentUserId)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 } else {
//                   var transaksiDocuments = snapshot.data.docs;
//                   // Create a Map to group transactions by month and year
//                   Map<String, List<Map<String, dynamic>>> groupedTransactions =
//                       {};

//                   transaksiDocuments.forEach((transactionDoc) {
//                     var transaksi = transactionDoc.data();
//                     // Extract month and year from the transaction date
//                     DateTime tanggalTransaksi =
//                         transaksi['tanggal_transaksi'].toDate();
//                     String monthYear =
//                         "${tanggalTransaksi.month}-${tanggalTransaksi.year}";

//                     // Add transaction to the corresponding group
//                     groupedTransactions.putIfAbsent(monthYear, () => []);
//                     groupedTransactions[monthYear].add(transaksi);
//                   });

//                   // Display transactions grouped by month and year using ExpansionTile
//                   return ListView.builder(
//                     itemCount: groupedTransactions.length,
//                     itemBuilder: (context, index) {
//                       var monthYear = groupedTransactions.keys.elementAt(index);
//                       var transactions = groupedTransactions[monthYear];

//                       // Calculate total harga for the month
//                       // int totalHarga = 0;
//                       // transactions.forEach((transaction) {
//                       //   // Ensure 'total_harga' is not null
//                       //   if (transaction['total_harga'] != null) {
//                       //     // Add 'total_harga' to the total
//                       //     totalHarga += transaction['total_harga'];
//                       //   }
//                       // });

//                       return ExpansionTile(
//                         title: Text('Bulan & Tahun: $monthYear'),
//                         // subtitle: Text('Total Harga: $totalHarga'),
//                         children: transactions.map((transaction) {
//                           return ListTile(
//                             title: Text('Tanggal: ${transaction['tanggal_transaksi']}, id kasir: ${transaction['id_kasir']}'),
//                             subtitle: Text('Total Harga: ${transaction['total_harga']}'),
//                           );
//                         }).toList(),
//                       );
//                     },
//                   );
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future<User> getCurrentUser() async {
//     User user = await _auth.currentUser;
//     return user;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';

// class TransaksiList extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Transaksi'),
//       ),
//       body: FutureBuilder(
//         future: getCurrentUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else {
//             String currentUserId = snapshot.data.uid;
//             return StreamBuilder(
//               stream: _firestore
//                   .collection('header_transaksi')
//                   .where('id_kasir', isEqualTo: currentUserId)
//                   .orderBy('tanggal_transaksi', descending: true) // Order by 'tanggal_transaksi' in descending order
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 print(snapshot.data); // Add this line to check the data received
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 } else {
//                   var transaksiDocuments = snapshot.data.docs;
//                   // Create a Map to group transactions by month and year
//                   Map<String, List<Map<String, dynamic>>> groupedTransactions =
//                       {};

//                   transaksiDocuments.forEach((transactionDoc) {
//                     var transaksi = transactionDoc.data();
//                     // Extract month and year from the transaction date
//                     DateTime tanggalTransaksi =
//                         transaksi['tanggal_transaksi'].toDate();
//                     String monthYear = DateFormat('MMMM-yyyy').format(tanggalTransaksi);

//                     // Add transaction to the corresponding group
//                     groupedTransactions.putIfAbsent(monthYear, () => []);
//                     groupedTransactions[monthYear].add(transaksi);
//                   });

//                   // Display transactions grouped by month and year using ExpansionTile
//                   return ListView.builder(
//                     itemCount: groupedTransactions.length,
//                     itemBuilder: (context, index) {
//                       var monthYear = groupedTransactions.keys.elementAt(index);
//                       var transactions = groupedTransactions[monthYear];

//                       // Calculate total harga for the month
//                       // int totalHarga = 0;
//                       // transactions.forEach((transaction) {
//                       //   // Ensure 'total_harga' is not null
//                       //   if (transaction['total_harga'] != null) {
//                       //     // Add 'total_harga' to the total
//                       //     totalHarga += transaction['total_harga'];
//                       //   }
//                       // });

//                       return ExpansionTile(
//                         title: Text('Bulan & Tahun: $monthYear'),
//                         // subtitle: Text('Total Harga: $totalHarga'),
//                         children: transactions.map((transaction) {
//                           return ListTile(
//                             title: Text('Tanggal: ${DateFormat('dd MMMM yyyy').format(transaction['tanggal_transaksi'].toDate())}, id kasir: ${transaction['id_kasir']}'),
//                             subtitle: Text('Total Harga: ${transaction['total_harga']}'),
//                           );
//                         }).toList(),
//                       );
//                     },
//                   );
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future<User> getCurrentUser() async {
//     User user = await _auth.currentUser;
//     return user;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';

// class TransaksiList extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Transaksi'),
//       ),
//       body: FutureBuilder(
//         future: getCurrentUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else {
//             String currentUserId = snapshot.data.uid;

//             // First query: Filter by id_kasir
//             Query queryByIdKasir = _firestore
//                 .collection('header_transaksi')
//                 .where('id_kasir', isEqualTo: currentUserId);

//             // Second query: Order by tanggal_transaksi
//             // Query queryOrderedByDate = queryByIdKasir.orderBy('tanggal_transaksi', descending: true);

//             return StreamBuilder(
//               stream: queryByIdKasir.snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 } else {
//                   var transaksiDocuments = snapshot.data.docs;
//                   // Create a Map to group transactions by month and year
//                   Map<String, List<Map<String, dynamic>>> groupedTransactions = {};

//                   transaksiDocuments.forEach((transactionDoc) {
//                     var transaksi = transactionDoc.data();
//                     // Extract month and year from the transaction date
//                     DateTime tanggalTransaksi = transaksi['tanggal_transaksi'].toDate();
//                     String monthYear = DateFormat('MMMM-yyyy').format(tanggalTransaksi);

//                     // Add transaction to the corresponding group
//                     groupedTransactions.putIfAbsent(monthYear, () => []);
//                     groupedTransactions[monthYear].insert(0, transaksi); // Insert at the beginning for newest to oldest
//                   });

//                   // Display transactions grouped by month and year using ExpansionTile
//                   return ListView.builder(
//                     itemCount: groupedTransactions.length,
//                     itemBuilder: (context, index) {
//                       var monthYear = groupedTransactions.keys.elementAt(index);
//                       var transactions = groupedTransactions[monthYear];

//                       return ExpansionTile(
//                         title: Text('Bulan & Tahun: $monthYear'),
//                         children: transactions.map((transaction) {
//                           return ListTile(
//                             title: Text(
//                                 'Tanggal: ${DateFormat('dd MMMM yyyy').format(transaction['tanggal_transaksi'].toDate())}, id kasir: ${transaction['id_kasir']}'),
//                             subtitle: Text('Total Harga: ${transaction['total_harga']}'),
//                           );
//                         }).toList(),
//                       );
//                     },
//                   );
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future<User> getCurrentUser() async {
//     User user = await _auth.currentUser;
//     return user;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';

// class TransaksiList extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Transaksi'),
//       ),
//       body: FutureBuilder(
//         future: getCurrentUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else {
//             String currentUserId = snapshot.data.uid;

//             // First query: Filter by id_kasir
//             Query queryByIdKasir = _firestore
//                 .collection('header_transaksi')
//                 .where('id_kasir', isEqualTo: currentUserId);

//             return StreamBuilder(
//               stream: queryByIdKasir.snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 } else {
//                   var transaksiDocuments = snapshot.data.docs;
//                   // Create a Map to group transactions by month and year
//                   Map<String, List<Map<String, dynamic>>> groupedTransactions = {};

//                   transaksiDocuments.forEach((transactionDoc) {
//                     var transaksi = transactionDoc.data();
//                     // Extract month and year from the transaction date
//                     DateTime tanggalTransaksi = transaksi['tanggal_transaksi'].toDate();
//                     String monthYear = DateFormat('MMMM-yyyy').format(tanggalTransaksi);

//                     // Add transaction to the corresponding group
//                     groupedTransactions.putIfAbsent(monthYear, () => []);
//                     groupedTransactions[monthYear].insert(0, transaksi); // Insert at the beginning for newest to oldest
//                   });

//                   // Display transactions grouped by month and year using ExpansionTile
//                   return ListView.builder(
//                     itemCount: groupedTransactions.length,
//                     itemBuilder: (context, index) {
//                       var monthYear = groupedTransactions.keys.elementAt(index);
//                       var transactions = groupedTransactions[monthYear];

//                       // Sort transactions in descending order based on the transaction date
//                       transactions.sort((a, b) {
//                         DateTime dateA = a['tanggal_transaksi'].toDate();
//                         DateTime dateB = b['tanggal_transaksi'].toDate();
//                         return dateB.compareTo(dateA);
//                       });

//                       return ExpansionTile(
//                         title: Text('Bulan & Tahun: $monthYear'),
//                         children: transactions.map((transaction) {
//                           return ListTile(
//                             title: Text(
//                                 'Tanggal: ${DateFormat('dd MMMM yyyy').format(transaction['tanggal_transaksi'].toDate())}, id kasir: ${transaction['id_kasir']}'),
//                             subtitle: Text('Total Harga: ${transaction['total_harga']}'),
//                           );
//                         }).toList(),
//                       );
//                     },
//                   );
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future<User> getCurrentUser() async {
//     User user = await _auth.currentUser;
//     return user;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';

// class TransaksiList extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: getCurrentUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else {
//             String currentUserId = snapshot.data.uid;

//             // First query: Filter by id_kasir
//             Query queryByIdKasir = _firestore
//                 .collection('header_transaksi')
//                 .where('id_kasir', isEqualTo: currentUserId);

//             return StreamBuilder(
//               stream: queryByIdKasir.snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 } else {
//                   var transaksiDocuments = snapshot.data.docs;
//                   // Create a Map to group transactions by month and year
//                   Map<String, List<Map<String, dynamic>>> groupedTransactions = {};

//                   transaksiDocuments.forEach((transactionDoc) {
//                     var transaksi = transactionDoc.data();
//                     // Extract month and year from the transaction date
//                     DateTime tanggalTransaksi = transaksi['tanggal_transaksi'].toDate();
//                     String monthYear = DateFormat('MMMM-yyyy').format(tanggalTransaksi);

//                     // Add transaction to the corresponding group
//                     groupedTransactions.putIfAbsent(monthYear, () => []);
//                     groupedTransactions[monthYear].insert(0, transaksi); // Insert at the beginning for newest to oldest
//                   });

//                   // Sort keys (monthYear) in descending order
//                   List<String> sortedKeys = groupedTransactions.keys.toList()
//                     ..sort((a, b) {
//                       DateTime dateA = DateFormat('MMMM-yyyy').parse(a);
//                       DateTime dateB = DateFormat('MMMM-yyyy').parse(b);
//                       return dateB.compareTo(dateA);
//                     });

//                   // Display transactions grouped by month and year using ExpansionTile
//                   return ListView.builder(
//                     itemCount: sortedKeys.length,
//                     itemBuilder: (context, index) {
//                       var monthYear = sortedKeys[index];
//                       var transactions = groupedTransactions[monthYear];

//                       // Sort transactions in descending order based on the transaction date
//                       transactions.sort((a, b) {
//                         DateTime dateA = a['tanggal_transaksi'].toDate();
//                         DateTime dateB = b['tanggal_transaksi'].toDate();
//                         return dateB.compareTo(dateA);
//                       });

//                       return ExpansionTile(
//                         title: Text('Bulan & Tahun: $monthYear'),
//                         children: transactions.map((transaction) {
//                           return ListTile(
//                             title: Text(
//                                 'Tanggal: ${DateFormat('dd MMMM yyyy').format(transaction['tanggal_transaksi'].toDate())}, id kasir: ${transaction['id_kasir']}'),
//                             subtitle: Text('Total Harga: ${transaction['total_harga']}'),
//                           );
//                         }).toList(),
//                       );
//                     },
//                   );
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future<User> getCurrentUser() async {
//     User user = await _auth.currentUser;
//     return user;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';

// class TransaksiList extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: getCurrentUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else {
//             String currentUserId = snapshot.data.uid;

//             // First query: Filter by id_kasir
//             Query queryByIdKasir = _firestore
//                 .collection('header_transaksi')
//                 .where('id_kasir', isEqualTo: currentUserId);

//             return StreamBuilder(
//               stream: queryByIdKasir.snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 } else {
//                   var transaksiDocuments = snapshot.data.docs;
//                   // Create a Map to group transactions by month and year
//                   Map<String, List<Map<String, dynamic>>> groupedTransactions = {};

//                   transaksiDocuments.forEach((transactionDoc) {
//                     var transaksi = transactionDoc.data();
//                     // Extract month and year from the transaction date
//                     DateTime tanggalTransaksi = transaksi['tanggal_transaksi'].toDate();
//                     String monthYear = DateFormat('MM-yyyy').format(tanggalTransaksi);

//                     // Add transaction to the corresponding group
//                     groupedTransactions.putIfAbsent(monthYear, () => []);
//                     groupedTransactions[monthYear].insert(0, transaksi); // Insert at the beginning for newest to oldest
//                   });

//                   // Sort keys (monthYear) in descending order
//                   List<String> sortedKeys = groupedTransactions.keys.toList()
//                     ..sort((a, b) {
//                       DateTime dateA = DateFormat('MM-yyyy').parse(a);
//                       DateTime dateB = DateFormat('MM-yyyy').parse(b);
//                       return dateB.compareTo(dateA);
//                     });

//                   // Display transactions grouped by month and year using ExpansionTile
//                   return ListView.builder(
//                     itemCount: sortedKeys.length,
//                     itemBuilder: (context, index) {
//                       var monthYear = sortedKeys[index];
//                       var transactions = groupedTransactions[monthYear];

//                       // Sort transactions in descending order based on the transaction date
//                       transactions.sort((a, b) {
//                         DateTime dateA = a['tanggal_transaksi'].toDate();
//                         DateTime dateB = b['tanggal_transaksi'].toDate();
//                         return dateB.compareTo(dateA);
//                       });

//                       return ExpansionTile(
//                         title: Text('Bulan & Tahun: $monthYear'),
//                         children: transactions.map((transaction) {
//                           return ListTile(
//                             title: Text(
//                                 'Tanggal: ${DateFormat('dd MMMM yyyy').format(transaction['tanggal_transaksi'].toDate())}, id kasir: ${transaction['id_kasir']}'),
//                             subtitle: Text('Total Harga: ${transaction['total_harga']}'),
//                           );
//                         }).toList(),
//                       );
//                     },
//                   );
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future<User> getCurrentUser() async {
//     User user = await _auth.currentUser;
//     return user;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';

// class TransaksiList extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Map of numeric months to Indonesian month names
//   final Map<int, String> monthNames = {
//     1: 'Januari',
//     2: 'Februari',
//     3: 'Maret',
//     4: 'April',
//     5: 'Mei',
//     6: 'Juni',
//     7: 'juli',
//     8: 'Agustus',
//     9: 'September',
//     10: 'Oktober',
//     11: 'November',
//     12: 'Desember',
//     // Add other months as needed
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: getCurrentUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else {
//             String currentUserId = snapshot.data.uid;

//             // First query: Filter by id_kasir
//             Query queryByIdKasir = _firestore
//                 .collection('header_transaksi')
//                 .where('id_kasir', isEqualTo: currentUserId);

//             return StreamBuilder(
//               stream: queryByIdKasir.snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 } else {
//                   var transaksiDocuments = snapshot.data.docs;
//                   // Create a Map to group transactions by month and year
//                   Map<String, List<Map<String, dynamic>>> groupedTransactions = {};

//                   transaksiDocuments.forEach((transactionDoc) {
//                     var transaksi = transactionDoc.data();
//                     // Extract month and year from the transaction date
//                     DateTime tanggalTransaksi = transaksi['tanggal_transaksi'].toDate();
//                     String monthYear = DateFormat('MM-yyyy').format(tanggalTransaksi);

//                     // Add transaction to the corresponding group
//                     groupedTransactions.putIfAbsent(monthYear, () => []);
//                     groupedTransactions[monthYear].insert(0, transaksi); // Insert at the beginning for newest to oldest
//                   });

//                   // Sort keys (monthYear) in descending order
//                   List<String> sortedKeys = groupedTransactions.keys.toList()
//                     ..sort((a, b) {
//                       DateTime dateA = DateFormat('MM-yyyy').parse(a);
//                       DateTime dateB = DateFormat('MM-yyyy').parse(b);
//                       return dateB.compareTo(dateA);
//                     });

//                   // Display transactions grouped by month and year using ExpansionTile
//                   return ListView.builder(
//                     itemCount: sortedKeys.length,
//                     itemBuilder: (context, index) {
//                       var monthYear = sortedKeys[index];
//                       var transactions = groupedTransactions[monthYear];

//                       // Sort transactions in descending order based on the transaction date
//                       transactions.sort((a, b) {
//                         DateTime dateA = a['tanggal_transaksi'].toDate();
//                         DateTime dateB = b['tanggal_transaksi'].toDate();
//                         return dateB.compareTo(dateA);
//                       });

//                       return ExpansionTile(
//                         title: Text('Bulan & Tahun: ${getIndonesianMonth(monthYear)}'),
//                         children: transactions.map((transaction) {
//                           return ListTile(
//                             title: Text(
//                                 'Tanggal transaksi: ${DateFormat('dd MM yyyy').format(transaction['tanggal_transaksi'].toDate())}'),
//                             subtitle: Text('Total Harga: ${transaction['total_harga']}'),
//                           );
//                         }).toList(),
//                       );
//                     },
//                   );
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future<User> getCurrentUser() async {
//     User user = await _auth.currentUser;
//     return user;
//   }

//   // Function to get Indonesian month name
//   String getIndonesianMonth(String monthYear) {
//     List<String> parts = monthYear.split('-');
//     int month = int.parse(parts[0]);
//     int year = int.parse(parts[1]);
//     return '${monthNames[month]} $year';
//   }
// }

//////////////////////////ini fitur cari tapi garai stereeeeesssss berjam-jam benakno ga mari mari

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';

// class DaftarTransaksi extends StatefulWidget {
//   @override
//   _DaftarTransaksiState createState() => _DaftarTransaksiState();
// }

// class _DaftarTransaksiState extends State<DaftarTransaksi> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   DateTime _tanggalAwal = DateTime.now();
//   DateTime _tanggalAkhir = DateTime.now();

//   // DateTime _tanggalAwal;
//   // DateTime _tanggalAkhir;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daftar Transaksi'),
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               TextButton(
//                 onPressed: () => _pilihTanggal(context, true),
//                 child: Text('Tanggal Awal'),
//               ),
//               Text(_tanggalAwal == null ? 'Pilih Tanggal' : DateFormat('dd-MM-yyyy').format(_tanggalAwal)),
//               TextButton(
//                 onPressed: () => _pilihTanggal(context, false),
//                 child: Text('Tanggal Akhir'),
//               ),
//               Text(_tanggalAkhir == null ? 'Pilih Tanggal' : DateFormat('dd-MM-yyyy').format(_tanggalAkhir)),
//             ],
//           ),
//           Expanded(
//             child: StreamBuilder(
//               stream: _firestore
//                   .collection('header_transaksi')
//                   .where('id_kasir', isEqualTo: _dapatkanIdPenggunaSaatIni())
//                   .where('tanggal_transaksi', isGreaterThanOrEqualTo: _tanggalAwal?.microsecondsSinceEpoch ?? 0)
// .where('tanggal_transaksi', isLessThanOrEqualTo: _tanggalAkhir?.microsecondsSinceEpoch ?? DateTime.now().microsecondsSinceEpoch)

//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 } else {
//                   var transaksi = snapshot.data.docs;

//                   return ListView.builder(
//                     itemCount: transaksi.length,
//                     itemBuilder: (context, index) {
//                       var transaksiData = transaksi[index].data();
//                       return ListTile(
//                         title: Text(
//                           'Tanggal transaksi: ${DateFormat('dd MM yyyy').format(transaksiData['tanggal_transaksi'].toDate())}',
//                         ),
//                         subtitle: Text('Total Harga: ${transaksiData['total_harga']}'),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _pilihTanggal(BuildContext context, bool isTanggalAwal) async {
//     final DateTime dipilih = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2101),
//     );

//     if (dipilih != null && dipilih != (isTanggalAwal ? _tanggalAwal : _tanggalAkhir)) {
//       setState(() {
//         if (isTanggalAwal) {
//           _tanggalAwal = dipilih;
//         } else {
//           _tanggalAkhir = dipilih;
//         }
//       });
//     }
//   }

//   Future<String> _dapatkanIdPenggunaSaatIni() async {
//     User user = await _auth.currentUser;
//     return user.uid;
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class TransaksiList extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Map of numeric months to Indonesian month names
  final Map<int, String> monthNames = {
    1: 'Januari',
    2: 'Februari',
    3: 'Maret',
    4: 'April',
    5: 'Mei',
    6: 'Juni',
    7: 'Juli',
    8: 'Agustus',
    9: 'September',
    10: 'Oktober',
    11: 'November',
    12: 'Desember',
    // Add other months as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.red), // Change progress indicator color to red
              ),
            );
          } else {
            String currentUserId = snapshot.data.uid;

            // First query: Filter by id_kasir
            Query queryByIdKasir = _firestore
                .collection('header_transaksi')
                .where('id_kasir', isEqualTo: currentUserId);

            return StreamBuilder(
              stream: queryByIdKasir.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.red), // Change progress indicator color to red
                    ),
                  );
                } else {
                  var transaksiDocuments = snapshot.data.docs;

                  // Create a Map to group transactions by month and year
                  Map<String, List<Map<String, dynamic>>> groupedTransactions =
                      {};

                  transaksiDocuments.forEach((transactionDoc) {
                    var transaksi = transactionDoc.data();

                    String headerTransactionId = transactionDoc.id;
                    print('Header Transaction ID: $headerTransactionId');
                    // Extract month and year from the transaction date
                    DateTime tanggalTransaksi =
                        transaksi['tanggal_transaksi'].toDate();
                    String monthYear =
                        DateFormat('MM-yyyy').format(tanggalTransaksi);

                    // Add transaction to the corresponding group
                    groupedTransactions.putIfAbsent(monthYear, () => []);
                    groupedTransactions[monthYear].insert(0,
                        transaksi); // Insert at the beginning for newest to oldest
                  });

                  // Sort keys (monthYear) in descending order
                  List<String> sortedKeys = groupedTransactions.keys.toList()
                    ..sort((a, b) {
                      DateTime dateA = DateFormat('MM-yyyy').parse(a);
                      DateTime dateB = DateFormat('MM-yyyy').parse(b);
                      return dateB.compareTo(dateA);
                    });

                  // Display transactions grouped by month and year using ExpansionTile
                  return ListView.builder(
                    itemCount: sortedKeys.length,
                    itemBuilder: (context, index) {
                      var monthYear = sortedKeys[index];
                      var transactions = groupedTransactions[monthYear];

                      // Sort transactions in descending order based on the transaction date
                      transactions.sort((a, b) {
                        DateTime dateA = a['tanggal_transaksi'].toDate();
                        DateTime dateB = b['tanggal_transaksi'].toDate();
                        return dateB.compareTo(dateA);
                      });

                      return Padding(
                        padding: EdgeInsets.only(
                            top: 8.0,
                            left: 10.0,
                            right: 10.0), // Tambahkan padding 10 pada ListTile
                        child: Card(
                          elevation: 4.0, // Atur tinggi shadow card
                          child: ExpansionTile(
                            iconColor: Colors.red,
                            textColor: Colors.red,
                            title: Container(
                              child: Text(
                                '${getIndonesianMonth(monthYear)}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            children: transactions.map((transaction) {
                              // String headerTransactionId = transactionDoc.id;
                              return MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                      // context,
                                      // MaterialPageRoute(
                                      //   builder: (context) =>
                                      //       TransactionDetailPage(
                                      //     headerTransactionId: headerTransactionId,
                                      //   ),
                                      // ),
                                    // );
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        'Tanggal transaksi: ${DateFormat('dd MM yyyy').format(transaction['tanggal_transaksi'].toDate())}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        'Total Harga: ${transaction['total_harga']}, id transaksi : ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  Future<User> getCurrentUser() async {
    User user = await _auth.currentUser;
    return user;
  }

  // Function to get Indonesian month name
  String getIndonesianMonth(String monthYear) {
    List<String> parts = monthYear.split('-');
    int month = int.parse(parts[0]);
    int year = int.parse(parts[1]);
    return '${monthNames[month]} $year';
  }
}

// import 'package:flutter/material.dart';

class TransactionDetailPage extends StatelessWidget {
  final String headerTransactionId;

  TransactionDetailPage({@required this.headerTransactionId});

  @override
  Widget build(BuildContext context) {
    // Fetch detailed information about the transaction using headerTransactionId
    // ...

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Transaction ID: $headerTransactionId',
              style: TextStyle(fontSize: 20),
            ),
            // Display other transaction details here
          ],
        ),
      ),
    );
  }
}


// class TransactionDetailPage extends StatelessWidget {
//   final Map<String, dynamic> transaction;

//   TransactionDetailPage({@required this.transaction});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Transaction Detail'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Display transaction details here
//           Text(
//               'Tanggal transaksi: ${DateFormat('dd MM yyyy').format(transaction['tanggal_transaksi'].toDate())}'),
//           Text('Total Harga: ${transaction['total_harga']}'),
//           // Add more details if needed
//         ],
//       ),
//     );
//   }
// }


// class HeaderTransaksi {
//   final String kasirId;
//   final String idCustomer;
//   final DateTime tanggalTransaksi;
//   final double totalHarga;

//   HeaderTransaksi({
//     @required this.kasirId,
//     @required this.idCustomer,
//     @required this.tanggalTransaksi,
//     @required this.totalHarga,
//   });
// }

// class HalamanDetailTransaksi extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;

//     if (args != null && args.containsKey('headerTransaksiId')) {
//       final String headerTransaksiId = args['headerTransaksiId'];

//       return StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('header_transaksi')
//             .doc(headerTransaksiId)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Scaffold(
//               appBar: AppBar(
//                 title: Text('Detail Transaksi'),
//                 leading: IconButton(
//                   icon: Icon(Icons.arrow_back, color: Colors.white),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }

//           var headerData = snapshot.data.data();
//           var headerTransaksi = HeaderTransaksi(
//             kasirId: headerData['id_kasir'],
//             idCustomer: headerData['id_customer'],
//             tanggalTransaksi: headerData['tanggal_transaksi'].toDate(),
//             totalHarga: headerData['total_harga'],
//           );

//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.red,
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Colors.white),
//                 onPressed: () {
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => TransaksiDetailWidget1()),
//                   // );
//                 },
//               ),
//               title: Text('Detail Transaksi Ehe'),
//             ),
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (headerTransaksi.kasirId != null)
//                   FutureBuilder(
//                     future: FirebaseFirestore.instance
//                         .collection('users')
//                         .doc(headerTransaksi.kasirId)
//                         .get(),
//                     builder: (context, kasirSnapshot) {
//                       if (!kasirSnapshot.hasData) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text('Kasir: Loading...'),
//                         );
//                       }

//                       var kasirData = kasirSnapshot.data.data();
//                       var namaKasir = kasirData['username'];

//                       return Container(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Kasir: $namaKasir'),
//                             Text(
//                                 'Tanggal: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(headerTransaksi.tanggalTransaksi)}'),
//                             Text('Customer ID: ${headerTransaksi.idCustomer}'),
//                             Text('Total Harga: ${headerTransaksi.totalHarga}'),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 Expanded(
//                   child: FutureBuilder(
//                     future: FirebaseFirestore.instance
//                         .collection('detail_transaksi')
//                         .where('id_header_transaksi',
//                             isEqualTo: headerTransaksiId)
//                         .get(),
//                     builder: (context, snapshot) {
//                       if (!snapshot.hasData) {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }

//                       var detailTransaksi = snapshot.data.docs;

//                       return FutureBuilder(
//                         future: _fetchProdukData(detailTransaksi),
//                         builder: (context, produkSnapshot) {
//                           if (!produkSnapshot.hasData) {
//                             return Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           }

//                           var produkData = produkSnapshot.data;

//                           return SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: DataTable(
//                               columns: [
//                                 DataColumn(label: Text('Nama Produk')),
//                                 DataColumn(
//                                   label: Text('Qty'),
//                                   numeric: true,
//                                 ),
//                                 DataColumn(
//                                   label: Text('Harga'),
//                                   numeric: true,
//                                 ),
//                               ],
//                               rows: _buildDataRow(
//                                 detailTransaksi,
//                                 produkData,
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Transaksi'),
//       ),
//       body: Center(
//         child: Text('Gagal memuat detail transaksi.'),
//       ),
//     );
//   }

//   Future<Map<String, dynamic>> _fetchProdukData(
//       List<QueryDocumentSnapshot> detailTransaksi) async {
//     Map<String, dynamic> produkData = {};

//     for (var detail in detailTransaksi) {
//       var produkId = detail.data()['id_produk'];
//       var produkSnapshot = await FirebaseFirestore.instance
//           .collection('produk')
//           .doc(produkId)
//           .get();
//       produkData[produkId] = produkSnapshot.data();
//     }

//     return produkData;
//   }

//   List<DataRow> _buildDataRow(List<QueryDocumentSnapshot> detailTransaksi,
//       Map<String, dynamic> produkData) {
//     List<DataRow> rows = [];

//     for (var index = 0; index < detailTransaksi.length; index++) {
//       var detail = detailTransaksi[index].data();
//       var produkId = detail['id_produk'];
//       var produkDetail = produkData[produkId];
//       var harga = produkDetail['harga_jual']; // Menambahkan harga barang

//       rows.add(
//         DataRow(
//           cells: [
//             DataCell(Text(produkDetail['nama_produk'])),
//             DataCell(Text(detail['qty'].toString())),
//             DataCell(Text('Rp ${harga.toString()}')),
//           ],
//         ),
//       );
//     }

//     return rows;
//   }
// }


