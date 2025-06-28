import 'package:flutter/material.dart';

class PengaturanAkunPage extends StatelessWidget {
  const PengaturanAkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Akun'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Bagian 1: Informasi Profil
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Nama Pengguna'),
            subtitle: Text('John Doe'),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('john.doe@example.com'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman edit profil
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigasi ke Edit Profil')),
              );
            },
            child: const Text('Edit Profil'),
          ),
          const Divider(),

          // Bagian 2: Keamanan
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Ubah Kata Sandi'),
            onTap: () {
              // Navigasi ke halaman ubah kata sandi
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigasi ke Ubah Kata Sandi')),
              );
            },
          ),
          const ListTile(
            leading: Icon(Icons.security),
            title: Text('Autentikasi Dua Faktor'),
            subtitle: Text('Nonaktif'),
            trailing: Switch(value: false, onChanged: null), // Statis untuk demo
          ),
          const Divider(),

          // Bagian 3: Notifikasi
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifikasi Push'),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // Logika untuk mengubah notifikasi
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
                // Logika untuk mengubah notifikasi
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Notifikasi Email: $value')),
                );
              },
            ),
          ),
          const Divider(),

          // Bagian 4: Preferensi
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Tema'),
            trailing: DropdownButton<String>(
              value: 'System Default',
              items: <String>['Light', 'Dark', 'System Default']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Logika untuk mengubah tema
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tema diubah ke: $newValue')),
                );
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Bahasa'),
            trailing: DropdownButton<String>(
              value: 'Indonesia',
              items: <String>['Indonesia', 'English']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Logika untuk mengubah bahasa
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Bahasa diubah ke: $newValue')),
                );
              },
            ),
          ),
          const Divider(),

          // Bagian 5: Aksi Akun
          ElevatedButton(
            onPressed: () {
              // Logika untuk logout
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logout berhasil')),
              );
            },
            child: const Text('Logout'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),
          TextButton(
            onPressed: () {
              // Logika untuk hapus akun dengan konfirmasi
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Konfirmasi Hapus Akun')),
              );
            },
            child: const Text('Hapus Akun', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}