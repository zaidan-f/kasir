import 'package:flutter/material.dart';
import 'detail_transaksi.dart';
import 'home_roma.dart';

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF1F4F8), // Background color
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Dashboard Penjualan',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCard(
                  title: 'Barang',
                  value: '125415',
                  isTitleBold: true,
                  color: Color(0xFFc42e1d),
                  textColor: Colors.white,
                ),
                CustomCard(
                  title: 'Stok Barang',
                  value: '200',
                  isTitleBold: true,
                  color: Color(0xFFc42e1d),
                  textColor: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCard(
                  title: 'Customer',
                  value: '1000',
                  isTitleBold: true,
                  color: Color(0xFFc42e1d),
                  textColor: Colors.white,
                ),
                CustomCard(
                  title: 'Toko',
                  value: '50',
                  isTitleBold: true,
                  color: Color(0xFFc42e1d),
                  textColor: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCard(
                  title: '-------',
                  value: '125415',
                  isTitleBold: true,
                  color: Color(0xFFc42e1d),
                  textColor: Colors.white,
                ),
                CustomCard(
                  title: '--------',
                  value: '200',
                  isTitleBold: true,
                  color: Color(0xFFc42e1d),
                  textColor: Colors.white,
                ),
              ],
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
  final bool isTitleBold;
  final Color color;
  final Color textColor;

  const CustomCard({
    this.title,
    this.value,
    this.isTitleBold = false,
    this.color = const Color(0xFFc42e1d),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: 190,
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
            Padding(
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
                // Padding(
                //                           padding:
                //                               EdgeInsets.fromLTRB(0, 12, 0, 0),
                //                           child: ElevatedButton(
                //                             onPressed: () {
                //                               Navigator.of(context).push(
                //                                 MaterialPageRoute(
                //                                   builder: (context) =>
                //                                       DetailsTransaksiWidget(),
                //                                 ),
                //                               );
                //                             },
                //                             child: Text('Detail')
                //                           ),
                //                         ),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsTransaksiWidget(),
                        ),
                      );
                    },
                    child: Text('Lihat Detail')),
                // child: Text(
                //   'Lihat Detail',
                //   style: TextStyle(
                //     fontFamily: 'Readex Pro',
                //     fontSize: 10,
                //     fontWeight: FontWeight.normal,
                //     color: textColor,
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'detail_transaksi.dart';

// class CustomCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final bool isTitleBold;
//   final Color titleBackgroundColor;
//   final Color titleTextColor;
//   final Color valueTextColor;
//   final Color buttonColor;
//   final Color buttonTextColor;

//   const CustomCard({
//     Key key,
//     @required this.title,
//     @required this.value,
//     this.isTitleBold = false,
//     this.titleBackgroundColor = Colors.red,
//     this.titleTextColor = Colors.white,
//     this.valueTextColor = Colors.white,
//     this.buttonColor = Colors.red,
//     this.buttonTextColor = Colors.white,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//       decoration: BoxDecoration(
//         color: titleBackgroundColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontFamily: 'Readex Pro',
//               fontSize: 18,
//               fontWeight: isTitleBold ? FontWeight.bold : FontWeight.normal,
//               color: titleTextColor,
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             value,
//             style: TextStyle(
//               fontFamily: 'Readex Pro',
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: valueTextColor,
//             ),
//           ),
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               primary: buttonColor,
//               onPrimary: buttonTextColor,
//             ),
//             child: Text('Button'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Beranda extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xFFF1F4F8), // Background color
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(15),
//               child: Text(
//                 'Dashboard Penjualan',
//                 style: TextStyle(
//                   fontFamily: 'Readex Pro',
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     CustomCard(
            //       title: 'Barang',
            //       value: '125415',
            //       isTitleBold: true,
            //     ),
            //     CustomCard(
            //       title: 'Stok Barang',
            //       value: '200',
            //       isTitleBold: true,
            //       titleBackgroundColor: Colors.red,
            //       valueTextColor: Colors.white,
            //       buttonColor: Colors.red,
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     CustomCard(
            //       title: 'Customer',
            //       value: '1000',
            //       isTitleBold: true,
            //     ),
            //     CustomCard(
            //       title: 'Toko',
            //       value: '50',
            //       isTitleBold: true,
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     CustomCard(
            //       title: '-------',
            //       value: '125415',
            //       isTitleBold: true,
            //     ),
            //     CustomCard(
            //       title: '--------',
            //       value: '200',
            //       isTitleBold: true,
            //     ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: Beranda(),
//   ));
// }

// import 'package:flutter/material.dart';
// import 'home_roma.dart';

// void main() {
//   runApp(MyApp());
// }

// class Beranda extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 fillColor: Colors.grey[200],
//                 filled: true,
//                 contentPadding: EdgeInsets.symmetric(vertical: 12.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                   borderSide: BorderSide.none,
//                 ),
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Dashboard Penjualan',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 children: List.generate(6, (index) {
//                   return Center(
//                     child: Card(
//                       elevation: 4.0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           // Handle card tap here.
//                         },
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Image.asset(
//                               'assets/images/product-$index.png',
//                               width: 100.0,
//                               height: 100.0,
//                             ),
//                             SizedBox(height: 8.0),
//                             Text(
//                               'Product $index',
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'home_roma.dart';

// void main() {
//   runApp(MyApp());
// }

// class Beranda extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Beranda',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Color(0xFFF1F4F8), // Background color
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(15),
//                 child: Text(
//                   'Dashboard Penjualan',
//                   style: TextStyle(
//                     fontFamily: 'Readex Pro',
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               CustomCardRow(
//                 title1: 'Barang',
//                 value1: '125415',
//                 title2: 'Stok Barang',
//                 value2: '200',
//               ),
//               CustomCardRow(
//                 title1: 'Customer',
//                 value1: '1000',
//                 title2: 'Toko',
//                 value2: '50',
//               ),
//               CustomCardRow(
//                 title1: '-------',
//                 value1: '125415',
//                 title2: '--------',
//                 value2: '200',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomCardRow extends StatelessWidget {
//   final String title1;
//   final String value1;
//   final String title2;
//   final String value2;

//   const CustomCardRow({
//     Key key,
//     @required this.title1,
//     @required this.value1,
//     @required this.title2,
//     @required this.value2,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CustomCard(title: title1, value: value1),
//         CustomCard(title: title2, value: value2),
//       ],
//     );
//   }
// }

// class CustomCard extends StatelessWidget {
//   final String title;
//   final String value;

//   const CustomCard({
//     Key key,
//     @required this.title,
//     @required this.value,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               value,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.0,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'home_roma.dart';

// void main() {
//   runApp(MyApp());
// }

// class Beranda extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 fillColor: Colors.grey[200],
//                 filled: true,
//                 contentPadding: EdgeInsets.symmetric(vertical: 12.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                   borderSide: BorderSide.none,
//                 ),
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Dashboard Penjualan',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 10), // Added margin
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusted alignment
//                     children: [
//                       CustomCard(
//                         title: 'Barang',
//                         value: '125415',
//                         isTitleBold: true,
//                         color: Color(0xFFc42e1d),
//                         textColor: Colors.white,
//                       ),
//                       CustomCard(
//                         title: 'Stok Barang',
//                         value: '200',
//                         isTitleBold: true,
//                         color: Color(0xFFc42e1d),
//                         textColor: Colors.white,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10), // Added margin
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusted alignment
//                     children: [
//                       CustomCard(
//                         title: 'Customer',
//                         value: '1000',
//                         isTitleBold: true,
//                         color: Color(0xFFc42e1d),
//                         textColor: Colors.white,
//                       ),
//                       CustomCard(
//                         title: 'Toko',
//                         value: '50',
//                         isTitleBold: true,
//                         color: Color(0xFFc42e1d),
//                         textColor: Colors.white,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10), // Added margin
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusted alignment
//                     children: [
//                       CustomCard(
//                         title: '-------',
//                         value: '125415',
//                         isTitleBold: true,
//                         color: Color(0xFFc42e1d),
//                         textColor: Colors.white,
//                       ),
//                       CustomCard(
//                         title: '--------',
//                         value: '200',
//                         isTitleBold: true,
//                         color: Color(0xFFc42e1d),
//                         textColor: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final bool isTitleBold;
//   final Color color;
//   final Color textColor;

//   const CustomCard({
//     Key key,
//     @required this.title,
//     @required this.value,
//     this.isTitleBold = false,
//     this.color,
//     this.textColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       color: color ?? Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontWeight: isTitleBold ? FontWeight.bold : FontWeight.normal,
//                 color: textColor ?? Colors.black,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               value,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.0,
//                 color: textColor ?? Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
