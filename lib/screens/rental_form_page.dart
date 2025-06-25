import 'package:flutter/material.dart';

class RentalFormPage extends StatefulWidget {
  final Map<String, dynamic> car;

  const RentalFormPage({super.key, required this.car});

  @override
  State<RentalFormPage> createState() => _RentalFormPageState();
}

class _RentalFormPageState extends State<RentalFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ktpController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pickupLocationController = TextEditingController();
  final TextEditingController guaranteeController = TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();

  // Tanggal sewa
  DateTime? startDate;
  DateTime? endDate;

  // Fungsi memilih tanggal
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
        } else {
          endDate = picked;
        }
      });
    }
  }

  // Fungsi konversi harga string ke int
  int _parseHarga(String priceString) {
    final angka = priceString.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(angka) ?? 0;
  }

  // Fungsi format rupiah
  String _formatRupiah(int amount) {
    final s = amount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
    return 'Rp$s';
  }

  // Hitung jumlah hari
  int _getJumlahHari() {
    if (startDate != null && endDate != null) {
      return endDate!.difference(startDate!).inDays + 1;
    }
    return 0;
  }

  // Hitung total harga
  int _getTotalHarga() {
    int jumlahHari = _getJumlahHari();
    int hargaPerHari = _parseHarga(widget.car['price']);
    return jumlahHari * hargaPerHari;
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
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        children: [
                          TextSpan(text: 'Mob'),
                          WidgetSpan(child: Icon(Icons.circle, color: Colors.lightBlue, size: 16)),
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
                            decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                            child: const Text('6', style: TextStyle(fontSize: 10, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Formulir Sewa Mobil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),

                // Form Input
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

                // Tanggal
                Row(
                  children: [
                    Expanded(
                      child: _buildDateField(
                        label: 'Tgl Sewa *',
                        selectedDate: startDate,
                        onTap: () => _selectDate(context, true),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildDateField(
                        label: 'Tgl Kembali *',
                        selectedDate: endDate,
                        onTap: () => _selectDate(context, false),
                      ),
                    ),
                  ],
                ),

                _buildReadOnlyField('Jenis Mobil', car['name']),
                _buildTextField('Lokasi Ambil *', pickupLocationController),
                _buildTextField('Jaminan *', guaranteeController),
                _buildTextField('Metode Pembayaran *', paymentMethodController),

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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Pesanan berhasil dikirim!')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                    child: const Text('Bayar Sekarang'),
                  ),
                )
              ],
            ),
          ),
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

  Widget _buildDateField({required String label, required DateTime? selectedDate, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: _buildReadOnlyField(
          label,
          selectedDate != null ? "${selectedDate.day} ${_monthName(selectedDate.month)} ${selectedDate.year}" : '',
        ),
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
