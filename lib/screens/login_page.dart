import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_navigation.dart'; // ✅ path diperbaiki

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  children: [
                    TextSpan(text: 'M', style: TextStyle(color: Colors.black)),
                    WidgetSpan(
                      child: Icon(Icons.circle, color: Colors.lightBlue, size: 40),
                      alignment: PlaceholderAlignment.middle,
                    ),
                    TextSpan(text: 'bilin', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text('Rent Your Favorite Car', style: TextStyle(color: Colors.grey[700])),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Forgot password?', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman utama setelah login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainNavigation()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 3, 160, 244),
                  ),
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      // TODO: arahkan ke halaman register
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.apple, size: 32),
                  const SizedBox(width: 20),
                  const Icon(Icons.facebook, size: 32, color: Colors.blue),
                  const SizedBox(width: 20),
                  Image.asset('assets/google.png', height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
