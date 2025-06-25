import 'package:flutter/material.dart';
import 'car_detail_page.dart'; // Pastikan file ini ada

class AvailableCarsPage extends StatelessWidget {
  const AvailableCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cars = [
      {
        'brand': 'Toyota',
        'name': 'INNOVA REBORN',
        'image': 'assets/innova.png',
        'seat': '8 penumpang',
        'transmission': 'Manual',
        'type': 'Hatchback',
        'fuel': 'Bensin',
        'price': 'Rp500.000/hari',
      },
      {
        'brand': 'Toyota',
        'name': 'AGYA New',
        'image': 'assets/agya.png',
        'seat': '4 penumpang',
        'transmission': 'Matic',
        'type': 'Hatchback',
        'fuel': 'Bensin',
        'price': 'Rp250.000/hari',
      },
      {
        'brand': 'Toyota',
        'name': 'AVANZA NEW',
        'image': 'assets/avanza.png',
        'seat': '6 penumpang',
        'transmission': 'Matic',
        'type': 'Hatchback',
        'fuel': 'Bensin',
        'price': 'Rp350.000/hari',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                    children: [
                      const TextSpan(text: 'M'),
                      WidgetSpan(child: Icon(Icons.circle, color: Colors.lightBlue, size: 40)),
                      const TextSpan(text: 'bilin'),
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
                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                        child: const Text('6', style: TextStyle(fontSize: 10, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Mobil Tersedia', style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('Yogyakarta'),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            ...cars.map((car) => Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.lightBlue, size: 16),
                            SizedBox(width: 4),
                            Text('4.9/5.0', style: TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Image.asset(car['image'], height: 80, width: 100, fit: BoxFit.contain),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(car['brand']),
                                  Text(car['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Wrap(
                                    spacing: 10,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.event_seat, size: 16),
                                          const SizedBox(width: 4),
                                          Text(car['seat'])
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.settings, size: 16),
                                          const SizedBox(width: 4),
                                          Text(car['transmission'])
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.local_gas_station, size: 16),
                                          const SizedBox(width: 4),
                                          Text(car['fuel'])
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(car['price'], style: const TextStyle(color: Colors.blue)),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => CarDetailPage(car: car),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.lightBlue,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        ),
                                        child: const Text('Pesan'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Pesanan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}