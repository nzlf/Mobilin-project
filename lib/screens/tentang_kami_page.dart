import 'package:flutter/material.dart';

class TentangKamiPage extends StatelessWidget {
  const TentangKamiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Kami')),
      body: const Center(child: Text('Informasi Tentang Developer')),
    );
  }
}
