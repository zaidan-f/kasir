import 'package:flutter/material.dart';

class DetailsTransaksiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Durapos'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Product',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 60),
                          Text('Qty',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 55),
                          Text('Total',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 60),
                          Text('Option',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildProductRow(
                              'Mi Goreng', '2', 'Rp 10.000', context),
                          _buildProductRow(
                              'Mi Goreng', '8', 'Rp 10.000', context),
                          _buildProductRow(
                              'Mi Goreng', '2', 'Rp 10.000', context),
                          _buildProductRow(
                              'Mi Goreng', '2', 'Rp 10.000', context),
                          _buildProductRow(
                              'Mi Goreng', '2', 'Rp 10.000', context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductRow(
      String productName, String quantity, String total, BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            productName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(width: 60),
          Text(
            quantity,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(width: 55),
          Text(
            total,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(width: 60),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  print('Edit button pressed');
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  print('Delete button pressed');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
