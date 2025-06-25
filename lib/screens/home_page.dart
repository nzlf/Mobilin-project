import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/available_cars_page.dart'; // pastikan path ini sesuai

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: 'Mob'),
                      WidgetSpan(
                        child: Icon(Icons.circle, color: Colors.lightBlue, size: 20),
                      ),
                      TextSpan(text: 'ilin'),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    const Icon(Icons.notifications_none, size: 28),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '6',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Pencarian Mobil
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Yogyakarta',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Tgl Ambil',
                            prefixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Tgl Kembali',
                            prefixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AvailableCarsPage(),
                          ),
                        );
                      },
                      child: const Text('Cari Mobil'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Promo Spesial
            const Text(
              'Promo Spesial',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(child: Text('Promo di sini')),
            ),
            const SizedBox(height: 20),

            // Rekomendasi
            const Text(
              'Rekomendasi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            _buildCarRecommendationCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildCarRecommendationCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8, left: 12),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.blue, size: 16),
                SizedBox(width: 4),
                Text('4.9/5.0'),
              ],
            ),
          ),
          Image.asset('assets/brio.png'), // pastikan file tersedia
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Honda',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const Text(
                  'Brio Satya',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.event_seat, size: 16),
                        SizedBox(width: 4),
                        Text('4 Seat'),
                        SizedBox(width: 12),
                        Icon(Icons.settings, size: 16),
                        SizedBox(width: 4),
                        Text('Matic'),
                        SizedBox(width: 12),
                        Icon(Icons.local_gas_station, size: 16),
                        SizedBox(width: 4),
                        Text('Petrol 69'),
                      ],
                    ),
                    Text(
                      'Rp200.000/hari',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Pesan Sekarang'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
