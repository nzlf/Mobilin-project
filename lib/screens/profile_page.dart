import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'pengaturan_akun_page.dart';
import 'rating_app_page.dart';
import 'tentang_kami_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(text: 'Mob'),
                        WidgetSpan(
                          child: Icon(Icons.circle, size: 14, color: Colors.lightBlue),
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
                          decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                          child: const Text('6', style: TextStyle(fontSize: 10, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),

            // Profile Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lightBlue[700],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile.jpg'), // sesuaikan
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Whitehouse2', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text('@menukan2', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfilePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    child: const Text('Edit Profile', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Menu Bar
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.person_outline,
                    title: 'Pengaturan akun',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PengaturanAkunPage()),
                    ),
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.star,
                    title: 'Rating Aplikasi Kami',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RatingAppPage()),
                    ),
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.info_outline,
                    title: 'Tentang Kami',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TentangKamiPage()),
                    ),
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.logout,
                    title: 'Log Out',
                    onTap: () => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Konfirmasi'),
                        content: const Text('Yakin ingin logout?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Logout berhasil')),
                              );
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Pesanan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.orange),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
        const Divider(height: 1),
      ],
    );
  }
}
