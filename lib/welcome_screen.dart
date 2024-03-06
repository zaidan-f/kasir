import 'package:flutter/material.dart';
import 'rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 30),
                Icon(
                  Icons.shopping_cart_sharp,
                  color: Colors.red,
                  size: 250,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Text(
                    'Selamat datang di Duracash!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30, // Ukuran teks 22px
                      fontWeight: FontWeight
                          .bold, // Atur ketebalan teks sesuai kebutuhan
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  'Manajemen Penjualan dengan Mudah',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14, // Ukuran teks 22px
                    // fontWeight: FontWeight
                    //     .bold, // Atur ketebalan teks sesuai kebutuhan
                  ),
                  
                ),
                
                // SizedBox(height: 30),
                // Text(
                //   'Solusi untuk bisnis kecil hingga menengah.\nMengelola stok, transaksi, dan laporan lebih efisien.',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 14,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: 30),
                // RoundedButton(
                //   colour: Colors.black,
                //   title: 'Mulai',
                //   onPressed: () {
                //     Navigator.pushNamed(context, 'login_screen');
                //   },
                // ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login_screen');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30), // Sesuaikan dengan radius yang diinginkan
                    ),
                    fixedSize:
                        Size.fromHeight(40), // Sesuaikan tinggi yang diinginkan
                  ),
                  child: Text(
                    'Mulai',
                    style: TextStyle(fontSize: 14),
                  ),
                )
                // RoundedButton(
                //     colour: Colors.blueAccent,
                //     title: 'Register',
                //     onPressed: () {
                //       Navigator.pushNamed(context, 'registration_screen');
                //     }),
              ]),
        ));
  }
}
