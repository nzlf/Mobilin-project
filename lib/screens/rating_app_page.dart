import 'package:flutter/material.dart';

class RatingAppPage extends StatelessWidget {
  const RatingAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rating Aplikasi')),
      body: const Center(child: Text('Halaman Rating Aplikasi')),
    );
  }
}
