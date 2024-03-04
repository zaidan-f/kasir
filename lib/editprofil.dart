import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController _alamatController = TextEditingController();
  TextEditingController _kelurahanController = TextEditingController();
  TextEditingController _kecamatanController = TextEditingController();
  TextEditingController _kotaController = TextEditingController();
  TextEditingController _provinsiController = TextEditingController();
  TextEditingController _kodeposController = TextEditingController();
  TextEditingController _noTlpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    String userId = _auth.currentUser?.uid ?? "";
    if (userId.isNotEmpty) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        setState(() {
          _alamatController.text = userData['alamat'] ?? '';
          _kelurahanController.text = userData['kelurahan'] ?? '';
          _kecamatanController.text = userData['kecamatan'] ?? '';
          _kotaController.text = userData['kota'] ?? '';
          _provinsiController.text = userData['provinsi'] ?? '';
          _kodeposController.text = userData['kodepos'] ?? '';
          _noTlpController.text = userData['no_tlp'] ?? '';
        });
      }
    }
  }

  Future<void> _updateUserData() async {
    String userId = _auth.currentUser?.uid ?? "";
    if (userId.isNotEmpty) {
      await _firestore.collection('users').doc(userId).update({
        'alamat': _alamatController.text,
        'kelurahan': _kelurahanController.text,
        'kecamatan': _kecamatanController.text,
        'kota': _kotaController.text,
        'provinsi': _provinsiController.text,
        'kodepos': _kodeposController.text,
        'no_tlp': _noTlpController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data saved successfully!')),
      );
      Navigator.pop(
          context); // Kembali ke halaman profil setelah data diperbarui
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
        backgroundColor: Color(0xFFc42e1d),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Nomor telepon',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _noTlpController,
              decoration: InputDecoration(
                hintText: "Input nomor telepon",
                filled: true,
                fillColor: Color(0xFFF1F4F8),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border focus
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Harap isi bidang ini!';
                }
                return null;
              },
              style: TextStyle(
                fontSize: 14,
              ),
              cursorColor: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              'Alamat',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _alamatController,
              decoration: InputDecoration(
                hintText: "Input alamat",
                filled: true,
                fillColor: Color(0xFFF1F4F8),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border focus
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Harap isi bidang ini!';
                }
                return null;
              },
              style: TextStyle(
                fontSize: 14,
              ),
              cursorColor: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              'kelurahan',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _kelurahanController,
              decoration: InputDecoration(
                hintText: "Input kelurahan",
                filled: true,
                fillColor: Color(0xFFF1F4F8),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border focus
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Harap isi bidang ini!';
                }
                return null;
              },
              style: TextStyle(
                fontSize: 14,
              ),
              cursorColor: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              'Kecamatan',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _kecamatanController,
              decoration: InputDecoration(
                hintText: "Input kecamatan",
                filled: true,
                fillColor: Color(0xFFF1F4F8),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border focus
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Harap isi bidang ini!';
                }
                return null;
              },
              style: TextStyle(
                fontSize: 14,
              ),
              cursorColor: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              'Kota',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _kotaController,
              decoration: InputDecoration(
                hintText: "Input kota",
                filled: true,
                fillColor: Color(0xFFF1F4F8),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border focus
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Harap isi bidang ini!';
                }
                return null;
              },
              style: TextStyle(
                fontSize: 14,
              ),
              cursorColor: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              'Provinsi',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _provinsiController,
              decoration: InputDecoration(
                hintText: "Input provinsi",
                filled: true,
                fillColor: Color(0xFFF1F4F8),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border focus
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Harap isi bidang ini!';
                }
                return null;
              },
              style: TextStyle(
                fontSize: 14,
              ),
              cursorColor: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              'Kode pos',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _kodeposController,
              decoration: InputDecoration(
                hintText: "Input kode pos",
                filled: true,
                fillColor: Color(0xFFF1F4F8),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // Hapus border focus
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Harap isi bidang ini!';
                }
                return null;
              },
              style: TextStyle(
                fontSize: 14,
              ),
              cursorColor: Colors.red,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 23, horizontal: 210), // Sesuaikan padding di sini
                primary: Colors.red,
              ),
              onPressed: _updateUserData,
              child: Text(
                'Simpan',
                style: TextStyle(
                  fontSize: 14, // Sesuaikan ukuran teks di sini
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: _updateUserData,
            //   style: ElevatedButton.styleFrom(
            //     primary: Color(0xFFc42e1d),
            //   ),
            //   child: Text('Simpan Perubahan'),
            // ),
          ],
        ),
      ),
    );
  }
}
