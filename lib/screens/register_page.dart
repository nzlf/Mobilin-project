import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),

              // Logo Mobilin
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
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
                      child: Icon(Icons.circle, color: Colors.lightBlue, size: 30 ),
                      alignment: PlaceholderAlignment.middle,
                    ),
                    TextSpan(text: 'bilin', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Rent Your Favorite Car',
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(height: 30),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),

              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Nomor HP',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 12),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Konfirmasi Password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    print('Register button pressed');
                    // Tambahkan logika proses di sini
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D87B0),
                  ),
                  child: Text('Register'), 
                ),
              ),

              SizedBox(height: 16),

              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'Sudah punya akun? Login',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
