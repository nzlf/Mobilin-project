import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // ✅ pastikan path ini sesuai dengan struktur folder kamu

void main() {
  runApp(const MobilinApp());
}

class MobilinApp extends StatelessWidget {
  const MobilinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // ✅ ganti ke SplashScreen dulu
    );
  }
}
