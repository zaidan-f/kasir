// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   String email;
//   String password;
//   bool showSpinner = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
//               child: Text(
//                 "Email",
//                 style: TextStyle(
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//             Padding(
//                 padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Color(0xFFF1F4F8),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: TextField(
//                       keyboardType: TextInputType.emailAddress,
//                       onChanged: (value) {
//                         email = value;
//                       },
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Input email',
//                         contentPadding: EdgeInsets.symmetric(vertical: 10.0),
//                       ),
//                       style: TextStyle(
//                         fontSize: 14,
//                       ),
//                       cursorColor: Colors.red,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
//                 child: Text(
//                   "Password",
//                   style: TextStyle(
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Color(0xFFF1F4F8),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: TextField(
//                       obscureText: true,
//                       onChanged: (value) {
//                         password = value;
//                       },
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Input password',
//                         contentPadding: EdgeInsets.symmetric(vertical: 10.0),
//                       ),
//                       style: TextStyle(
//                         fontSize: 14,
//                       ),
//                       cursorColor: Colors.red,
//                     ),
//                   ),
//                 ),
//               ),
//             SizedBox(
//               height: 24.0,
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
//               child: ElevatedButton(
//                 onPressed: () async {
//                   setState(() {
//                     showSpinner = true;
//                   });
//                   try {
//                     // Sign in with email and password
//                     final userCredential = await _auth.signInWithEmailAndPassword(
//                       email: email,
//                       password: password,
//                     );

//                     if (userCredential.user != null) {
//                       // Check if user exists in 'users' collection
//                       final userDoc = await _firestore.collection('users').doc(userCredential.user.uid).get();
//                       if (userDoc.exists) {
//                         Navigator.pushNamed(context, 'home_roma'); // User exists in 'users' collection
//                       } else {
//                         Navigator.pushNamed(context, 'home_admin'); // User exists in 'admin' collection
//                       }
//                     }
//                   } catch (e) {
//                     // Print any errors for debugging
//                     print(e);
//                   }
//                   setState(() {
//                     showSpinner = false;
//                   });
//                 },
//                 child: Text('Log In'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool showSpinner = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Ubah background menjadi merah
      body: Center(
        child: Container(
          height: 400,
          width: 300, // Sesuaikan dengan lebar yang diinginkan
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white, // Warna putih untuk kontainer
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                color: Colors.red,
                size: 60,
              ),
              Text(
                'DuraCash',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.black,
                  fontSize: 25, // Ukuran teks 22px
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Input email',
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    cursorColor: Colors.red,
                  ),
                ),
              ),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Input password',
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    cursorColor: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('Log In'),
                ),
                onPressed: () async {
    if (email == null || email.isEmpty || password == null || password.isEmpty) {
      // Tampilkan pemberitahuan bahwa semua bidang wajib diisi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Semua bidang wajib diisi!'),
          // backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Validasi email menggunakan ekspresi reguler
    if (!EmailValidator.validate(email)) {
      // Tampilkan pemberitahuan bahwa email tidak valid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email tidak valid!'),
          // backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      showSpinner = true;
    });

    try {
      // Sign in with email and password
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Check if user exists in 'users' collection
        final userDoc = await _firestore
            .collection('users')
            .doc(userCredential.user.uid)
            .get();

        if (userDoc.exists) {
          Navigator.pushNamed(context, 'home_roma'); // User exists in 'users' collection
        } else {
          Navigator.pushNamed(context, 'home_admin'); // User exists in 'admin' collection
        }
      }
    } catch (e) {
      // Print any errors for debugging
      print(e);

      // Tampilkan pemberitahuan bahwa login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login gagal. Email atau password salah!'),
          // backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      showSpinner = false;
    });
  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
