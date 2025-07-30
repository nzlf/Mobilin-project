import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screens/payment_page.dart';

class RentalFormPage extends StatefulWidget {
  final Map<String, dynamic> car;

  const RentalFormPage({super.key, required this.car});

  @override
  State<RentalFormPage> createState() => _RentalFormPageState();
}

class _RentalFormPageState extends State<RentalFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ktpController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pickupLocationController = TextEditingController();
  final TextEditingController guaranteeController = TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
          startDateController.text = "${picked.day} ${_monthName(picked.month)} ${picked.year}";
        } else {
          endDate = picked;
          endDateController.text = "${picked.day} ${_monthName(picked.month)} ${picked.year}";
        }
      });
    }
  }

  int _parseHarga(String priceString) {
    final angka = priceString.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(angka) ?? 0;
  }

  String _formatRupiah(int amount) {
    final s = amount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
    return 'Rp$s';
  }

  int _getJumlahHari() {
    if (startDate != null && endDate != null) {
      return endDate!.difference(startDate!).inDays + 1;
    }
    return 0;
  }

  int _getTotalHarga() {
    int jumlahHari = _getJumlahHari();
    int hargaPerHari = _parseHarga(widget.car['price']);
    return jumlahHari * hargaPerHari;
  }

  Future<void> _submitRental() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan login terlebih dahulu.')),
      );
      return;
    }

    try {
      final rentalData = {
        'userId': user.uid,
        'carId': widget.car['id'] ?? 'unknown',
        'carName': widget.car['name'] ?? '',
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
        'totalPrice': _getTotalHarga(),
        'createdAt': Timestamp.now(),
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'email': emailController.text.trim(),
        'ktp': ktpController.text.trim(),
        'phone': phoneController.text.trim(),
        'address': addressController.text.trim(),
        'pickupLocation': pickupLocationController.text.trim(),
        'guarantee': guaranteeController.text.trim(),
      };

      await FirebaseFirestore.instance.collection('rentals').add(rentalData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Penyewaan berhasil disimpan!')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => PaymentPage(total: _getTotalHarga()),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan data: $e')),
      );
    }
  }

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final car = widget.car;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔙 Tombol Back + Logo
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/mobilin.png',
                      height: 40,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Formulir Sewa Mobil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(child: _buildTextField('Nama Awal *', firstNameController)),
                    const SizedBox(width: 10),
                    Expanded(child: _buildTextField('Nama Akhir *', lastNameController)),
                  ],
                ),
                _buildTextField('Email *', emailController, hintText: 'contoh@gmail.com'),
                _buildTextField('No KTP *', ktpController),
                _buildTextField('No Handphone *', phoneController),
                _buildTextField('Alamat Tinggal *', addressController),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: _buildDateFieldWithController(
                        label: 'Tgl Sewa *',
                        controller: startDateController,
                        onTap: () => _selectDate(context, true),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildDateFieldWithController(
                        label: 'Tgl Kembali *',
                        controller: endDateController,
                        onTap: () => _selectDate(context, false),
                      ),
                    ),
                  ],
                ),

                _buildReadOnlyField('Jenis Mobil', car['name']),
                _buildTextField('Lokasi Ambil *', pickupLocationController),
                _buildTextField('Jaminan *', guaranteeController),

                if (startDate != null && endDate != null) ...[
                  _buildReadOnlyField('Durasi Sewa', '${_getJumlahHari()} hari'),
                  _buildReadOnlyField('Jumlah Pembayaran', _formatRupiah(_getTotalHarga())),
                ],

                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (startDate == null || endDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Pilih tanggal sewa dan kembali terlebih dahulu.')),
                          );
                          return;
                        }
                        _submitRental();
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                    child: const Text(
                      'Pesan Sekarang',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {String? hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        ),
        validator: (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        readOnly: true,
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _buildDateFieldWithController({
    required String label,
    required TextEditingController controller,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: _buildTextField(label, controller),
      ),
    );
  }

  String _monthName(int month) {
    const List<String> months = [
      "Januari", "Februari", "Maret", "April", "Mei", "Juni",
      "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ];
    return months[month - 1];
  }
}
