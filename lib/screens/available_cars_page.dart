import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'car_detail_page.dart';
import 'main_navigation.dart';

class AvailableCarsPage extends StatefulWidget {
  const AvailableCarsPage({super.key});

  @override
  State<AvailableCarsPage> createState() => _AvailableCarsPageState();
}

class _AvailableCarsPageState extends State<AvailableCarsPage> {
  List<Map<String, dynamic>> carList = [];

  @override
  void initState() {
    super.initState();
    fetchCars();
  }

  Future<void> fetchCars() async {
    final snapshot = await FirebaseFirestore.instance.collection('cars').get();
    final cars = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    setState(() {
      carList = cars;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MainNavigation(initialIndex: 0),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        'assets/mobilin.png',
                        height: 40,
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text('Yogyakarta'),
                    ],
                  ),
                ],
              ),
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Mobil Tersedia', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 8),

            // Daftar mobil
            Expanded(
              child: carList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: carList.length,
                      itemBuilder: (context, index) {
                        final car = carList[index];

                        final name = car['name'] ?? 'Nama tidak tersedia';
                        final brand = car['brand'] ?? 'Merek tidak tersedia';
                        final seat = car['seat']?.toString() ?? '-';
                        final transmission = car['transmission'] ?? '-';
                        final fuel = car['fuel'] ?? '-';
                        final price = car['price'] ?? 'Rp -';
                        final imagePath = car['image'] ?? '';

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8F2FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.star, color: Colors.blue, size: 16),
                                  SizedBox(width: 4),
                                  Text('4.9/5.0'),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Gambar mobil
                                  imagePath.isNotEmpty
                                      ? Image.asset(imagePath, width: 100, height: 60, fit: BoxFit.cover)
                                      : Container(
                                          width: 100,
                                          height: 60,
                                          color: Colors.grey[300],
                                          child: const Icon(Icons.directions_car, color: Colors.grey),
                                        ),
                                  const SizedBox(width: 12),

                                  // Info mobil
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(brand, style: const TextStyle(fontSize: 14)),
                                        Text(
                                          name,
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 4,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(Icons.people, size: 14),
                                                const SizedBox(width: 4),
                                                Text('$seat penumpang', style: const TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(Icons.settings, size: 14),
                                                const SizedBox(width: 4),
                                                Text(transmission, style: const TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(Icons.local_gas_station, size: 14),
                                                const SizedBox(width: 4),
                                                Text(fuel, style: const TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Text(price, style: const TextStyle(color: Colors.blue)),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  // Tombol Pesan
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
                                    ),
                                    child: const Text(
                                      'Pesan',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}