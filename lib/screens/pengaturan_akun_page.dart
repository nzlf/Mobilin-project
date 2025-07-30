import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/edit_profile_page.dart';

class PengaturanAkunPage extends StatefulWidget {
  const PengaturanAkunPage({super.key});

  @override
  State<PengaturanAkunPage> createState() => _PengaturanAkunPageState();
}

class _PengaturanAkunPageState extends State<PengaturanAkunPage> {
  final user = FirebaseAuth.instance.currentUser;
  String nama = '';
  String email = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      final doc = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      if (doc.exists) {
        setState(() {
          nama = doc['fullName'] ?? 'Tidak diketahui';
          email = doc['email'] ?? user!.email!;
          isLoading = false;
        });
      } else {
        setState(() {
          nama = 'Tidak ditemukan';
          email = user!.email!;
          isLoading = false;
        });
      }
    } catch (e) {
      print('Gagal ambil data user: $e');
      setState(() {
        nama = 'Error';
        email = user!.email!;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan Akun')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Nama Pengguna'),
                  subtitle: Text(nama),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Email'),
                  subtitle: Text(email),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditProfilePage()),
                    );
                  },
                  child: const Text(
                    'Edit Profil',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const Divider(),

                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text('Ubah Kata Sandi'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Navigasi ke Ubah Kata Sandi')),
                    );
                  },
                ),

                const ListTile(
                  leading: Icon(Icons.security),
                  title: Text('Autentikasi Dua Faktor'),
                  subtitle: Text('Nonaktif'),
                  trailing: Switch(value: false, onChanged: null),
                ),
                const Divider(),

                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notifikasi Push'),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Notifikasi Push: $value')),
                      );
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Notifikasi Email'),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Notifikasi Email: $value')),
                      );
                    },
                  ),
                ),
                const Divider(),

                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          contentPadding: const EdgeInsets.all(24),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Color(0xFF1976D2),
                                radius: 30,
                                child: Icon(Icons.waving_hand, size: 36, color: Colors.white),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Konfirmasi Log Out',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'Apakah Anda yakin ingin keluar dari akun Mobilin? Anda perlu login kembali untuk mengakses aplikasi.',
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('Batal'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await FirebaseAuth.instance.signOut();
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pushReplacementNamed('/login');
                                    },
                                    child: const Text('Ya, Log Out'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Konfirmasi Hapus Akun')),
                    );
                  },
                  child: const Text(
                    'Hapus Akun', 
                    style: TextStyle(color: Colors.black)
                  ),
                ),
              ],
            ),
    );
  }
}