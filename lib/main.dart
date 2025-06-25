import 'package:flutter/material.dart';
import 'screens/login_page.dart'; // ✅ pastikan ini sesuai dengan path file kamu

void main() {
  runApp(const MobilinApp());
}

class MobilinApp extends StatelessWidget {
  const MobilinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // ✅ ganti ke LoginPage agar login muncul saat awal
    );
  }
}
