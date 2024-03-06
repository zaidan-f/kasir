import 'package:flutter/material.dart';

class InformasiToko extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Transaksi'),
        backgroundColor:Color(0xFFc42e1d),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Profit Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: [
                _buildCard(context, '110', 'Customers',  color: Colors.black),
                _buildCard(context, 'Rp999k', 'Total Sales', color: Colors.red),
                _buildCard(context, '50', 'Revenue', color: Colors.black),
                _buildCard(context, '199', 'Customers', color: Colors.black),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Your Transactions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildTransactionCard(context, 'ID Transaksi', 'Feb 15, 2022', 'Rp10.000'),
                _buildTransactionCard(context, 'ID Transaksi', 'Feb 15, 2022', 'Rp18.000'),
                _buildTransactionCard(context, 'ID Transaksi', 'Feb 15, 2022', 'Rp12.000'),
                _buildTransactionCard(context, 'ID Transaksi', 'Feb 15, 2022', 'Rp1.000.000'),
                _buildTransactionCard(context, 'ID Transaksi', 'Feb 15, 2022', 'Rp50.000'),
                _buildTransactionCard(context, 'TZY200190202', 'Feb 15, 2022', 'Rp99.000'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String value, String title, {Color color = Colors.blue}) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionCard(BuildContext context, String id, String date, String amount) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  id,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            Text(
              amount,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InformasiToko(),
  ));
}
