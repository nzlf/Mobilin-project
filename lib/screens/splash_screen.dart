import 'package:flutter/material.dart';
import 'dart:async';
import 'login_page.dart'; // pastikan path sesuai

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tunggu 3 detik lalu navigasi ke LoginPage
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F89B3), // warna biru seperti gambar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(text: 'Mob'),
                  WidgetSpan(
                    child: Icon(Icons.circle, size: 20, color: Colors.white),
                  ),
                  TextSpan(text: 'ilin'),
                ],
              )
            ),
            const SizedBox(height: 8),
            const Text(
              'Rent Your Favorite Car',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 32),
            const SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.black,
                minHeight: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
