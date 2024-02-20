import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _kelurahanController = TextEditingController();
  final TextEditingController _kecamatanController = TextEditingController();
  final TextEditingController _kodeposController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();
  final TextEditingController _notlpController = TextEditingController();
  final TextEditingController _provinsiController = TextEditingController();
  final TextEditingController _tokoController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _register() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String alamat = _alamatController.text.trim();
    String kelurahan= _kelurahanController.text.trim();
    String kecamatan= _kecamatanController.text.trim();
    String kodepos = _kodeposController.text.trim();
    String kota = _kotaController.text.trim();
    String no_tlp = _notlpController.text.trim();
    String username = _usernameController.text.trim();
    String provinsi= _provinsiController.text.trim();
    String toko = _tokoController.text.trim();

    try {
      // Step 1: Mendaftarkan pengguna dengan email dan kata sandi
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Step 2: Menambahkan informasi tambahan ke profil pengguna di Firebase Authentication
      await userCredential.user?.updateProfile(displayName: username);

      // Step 3: Menyimpan informasi tambahan ke Firebase Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'alamat': alamat,
        'kecamatan': kecamatan,
        'kelurahan': kelurahan,
        'kodepos': kodepos,
        'kota': kota,
        'no_tlp': no_tlp,
        'provinsi': provinsi,
        'username': username,
        'toko' : toko,
        // Tambahkan informasi tambahan lainnya sesuai kebutuhan
      });

      // Registrasi berhasil, mungkin navigasi ke halaman selanjutnya
      Navigator.pushNamed(context, 'home_roma');
    //   Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomePage()),
    // );
    } catch (e) {
      print('Error during user registration: $e');
      // Handle error (e.g., display error message to the user)
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    // appBar: AppBar(
    //   title: Text('Registrasi Pengguna'),
    // ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nama Pengguna'),
            ),
            TextField(
              controller: _notlpController,
              decoration: InputDecoration(labelText: 'Nomor Telepon'),
            ),
            TextField(
              controller: _tokoController,
              decoration: InputDecoration(labelText: 'Toko'),
            ),
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            TextField(
              controller: _kelurahanController,
              decoration: InputDecoration(labelText: 'Kelurahan'),
            ),
            TextField(
              controller: _kecamatanController,
              decoration: InputDecoration(labelText: 'Kecamatan'),
            ),
            TextField(
              controller: _kotaController,
              decoration: InputDecoration(labelText: 'Kota'),
            ),
            TextField(
              controller: _provinsiController,
              decoration: InputDecoration(labelText: 'Provinsi'),
            ),
            TextField(
              controller: _kodeposController,
              decoration: InputDecoration(labelText: 'Kode Pos'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _register,
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    ),
  );
}

  }
