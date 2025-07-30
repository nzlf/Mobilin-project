import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingAppPage extends StatelessWidget {
  const RatingAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    double currentRating = 4.5;
    int totalReviews = 125;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF007BCE),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Rating Aplikasi Kami',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          // Logo dan Judul
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/mobilin.png',
                height: 28,
              ),
              const SizedBox(width: 6),
             
              
            ],
          ),
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F9FC),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'Berikan Rating Anda',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Kami selalu berusaha memberikan layanan terbaik untuk Anda. '
                    'Mohon berikan penilaian dan ulasan Anda agar kami dapat terus meningkatkan kualitas aplikasi ini.',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 16),

                  // Text Field Ulasan
                  const TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Tulis ulasan Anda disini...',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Tombol Kirim
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Kirim ke Firestore
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF007BCE),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Kirim Rating',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Rating Rata-Rata Saat Ini',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Text(
                        currentRating.toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(width: 8),
                      RatingBarIndicator(
                        rating: currentRating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        itemCount: 5,
                        itemSize: 24.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Berdasarkan $totalReviews penilaian pengguna.',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),

          // Footer
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              '© 2025 Mobilin. Semua hak cipta dilindungi.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
