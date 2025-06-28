import 'package:flutter/material.dart';
import 'rental_form_page.dart';

class CarDetailPage extends StatefulWidget {
  final Map<String, dynamic> car;

  const CarDetailPage({super.key, required this.car});

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  int jumlahHari = 1;

  @override
  Widget build(BuildContext context) {
    // Ambil harga per hari dari car['price']
    int hargaPerHari = _parseHarga(widget.car['price']);
    int totalHarga = jumlahHari * hargaPerHari;

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
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                        children: [
                          TextSpan(text: 'Mob'),
                          WidgetSpan(child: Icon(Icons.circle, color: Colors.lightBlue, size: 20)),
                          TextSpan(text: 'ilin'),
                        ],
                      ),
                    ),
                  ],
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

            // Mobil
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.asset(widget.car['image'], height: 150),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.car['brand'], style: const TextStyle(fontSize: 14)),
                          Text(
                            widget.car['name'],
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "Rp${_formatRupiah(totalHarga)} / $jumlahHari hari",
                        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Spesifikasi
                  Row(
                    children: [
                      _buildSpecBox(Icons.settings, 'Transmisi', widget.car['transmission']),
                      const SizedBox(width: 10),
                      _buildSpecBox(Icons.event_seat, 'Penumpang', widget.car['seat']),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildSpecBox(Icons.directions_car, 'Tipe', widget.car['type']),
                      const SizedBox(width: 10),
                      _buildSpecBox(Icons.local_gas_station, 'Bahan Bakar', widget.car['fuel']),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Text('Deskripsi Mobil', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'Mobil ini dirancang dengan kenyamanan dan efisiensi bahan bakar terbaik di kelasnya. Cocok untuk perjalanan keluarga maupun bisnis.',
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 16),
            const Text('Rating', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.lightBlue),
                SizedBox(width: 4),
                Text('4.9/5.0'),
              ],
            ),

            const SizedBox(height: 24),

            // Harga dan tombol
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rp${_formatRupiah(totalHarga)}",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (jumlahHari > 1) {
                          setState(() {
                            jumlahHari--;
                          });
                        }
                      },
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                    ),
                    Text('$jumlahHari hari'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          jumlahHari++;
                        });
                      },
                      icon: const Icon(Icons.add_circle, color: Colors.green),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RentalFormPage(car: widget.car),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Pesan Mobil'),
                ),
              ],
            ),

            const SizedBox(height: 8),
            Text('Total hari sewa: $jumlahHari', style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecBox(IconData icon, String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20),
            const SizedBox(height: 6),
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 2),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  int _parseHarga(String priceString) {
    // Contoh input: "Rp200.000/hari"
    final angka = priceString.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(angka) ?? 0;
  }

  String _formatRupiah(int amount) {
    final s = amount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
    return '$s';
  }
}