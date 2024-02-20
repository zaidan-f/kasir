// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class QtyWidget extends StatelessWidget {
//   const QtyWidget({Key key}) : super(key: key);

//   void _onPayButtonPressed(BuildContext context) {
//     // Simulate payment process
//     EasyLoading.show(status: 'Processing payment...');
//     Future.delayed(Duration(seconds: 1), () {
//       EasyLoading.dismiss();
//       Fluttertoast.showToast(msg: 'Payment successful');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Details'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Recipient',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Transaction ID'),
//                   Text('TXN123456789'),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Date'),
//                   Text('Fri, Jun 23 - 14:30'),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Amount'),
//                   Text('Rp. 30.000'),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Status'),
//                   Text('Completed'),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Payment Method'),
//                   Text('ATM'),
//                 ],
//               ), 
//               Divider(thickness: 2),
//               SizedBox(height: 16),
//               Text(
//                 'Transaction Breakdown',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Subtotal'),
//                   Text('Rp. 10.000'),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Tax'),
//                   Text('Rp. 20.000'),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Total',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   Text(
//                     'Rp. 13.000',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                 ],
//               ),
//               Divider(thickness: 2),
//               SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: () => _onPayButtonPressed(context),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 child: Text(
//                   'Pay',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Fluttertoast {
//   static void showToast({String msg}) {}
// }

// class EasyLoading {
//   static init() {}
  
//   static void dismiss() {}
  
//   static void show({String status}) {}
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: QtyWidget(),
//     ),
//     builder: EasyLoading.init(),
//   ));
// }
