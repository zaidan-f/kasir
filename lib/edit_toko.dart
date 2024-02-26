import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditToko extends StatefulWidget {
  @override
  _EditTokoState createState() => _EditTokoState();
}

class _EditTokoState extends State<EditToko> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController _namaTokoController = TextEditingController();
  TextEditingController _deskripsiTokoController = TextEditingController();
  TextEditingController _alamatTokoController = TextEditingController();
  TextEditingController _teleponTokoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchTokoData();
  }

  Future<void> _fetchTokoData() async {
    String userId = _auth.currentUser?.uid ?? "";
    if (userId.isNotEmpty) {
      DocumentSnapshot tokoDoc =
          await _firestore.collection('toko').doc(userId).get();
      if (tokoDoc.exists) {
        Map<String, dynamic> tokoData = tokoDoc.data() as Map<String, dynamic>;
        setState(() {
          _namaTokoController.text = tokoData['nama_toko'] ?? '';
          _deskripsiTokoController.text = tokoData['deskripsi_toko'] ?? '';
          _alamatTokoController.text = tokoData['alamat_toko'] ?? '';
          _teleponTokoController.text = tokoData['telepon_toko'] ?? '';
        });
      }
    }
  }

  Future<void> _updateTokoData() async {
    String userId = _auth.currentUser?.uid ?? "";
    if (userId.isNotEmpty) {
      await _firestore.collection('toko').doc(userId).update({
        'nama_toko': _namaTokoController.text,
        'deskripsi_toko': _deskripsiTokoController.text,
        'alamat_toko': _alamatTokoController.text,
        'telepon_toko': _teleponTokoController.text,
      });
      Navigator.pop(
          context); // Kembali ke halaman profil setelah data diperbarui
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Toko'),
        backgroundColor: Color(0xFFc42e1d),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _namaTokoController,
              decoration: InputDecoration(labelText: 'Nama Toko'),
            ),
            TextFormField(
              controller: _deskripsiTokoController,
              decoration: InputDecoration(labelText: 'Deskripsi Toko'),
            ),
            TextFormField(
              controller: _alamatTokoController,
              decoration: InputDecoration(labelText: 'Alamat Toko'),
            ),
            TextFormField(
              controller: _teleponTokoController,
              decoration: InputDecoration(labelText: 'Telepon Toko'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateTokoData,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFc42e1d),
              ),
              child: Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
