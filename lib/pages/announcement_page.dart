import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pengumuman',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Maintenance Pra UAS Semester Genap 2025/2026',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(Icons.person, size: 14, color: Colors.grey),
                ),
                const SizedBox(width: 8),
                const Text(
                  'By Admin Aerii - Rabu, 8 Desember 2025 , 10:45',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Image Placeholder (Banner)
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                   // Decorative shapes to look like the banner in the image
                   Positioned(
                     right: 0,
                     bottom: 0,
                     child: Opacity(
                       opacity: 0.2,
                       child: Icon(Icons.school, size: 150, color: Colors.blue),
                     ),
                   ),
                   const Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(Icons.build_circle, size: 60, color: AppColors.primary),
                       SizedBox(height: 8),
                       Text(
                         "Maintenance LMS", 
                         style: TextStyle(
                           color: AppColors.primary, 
                           fontWeight: FontWeight.bold,
                           fontSize: 20
                         )
                       ),
                       Text(
                         "Universitas Islam Madura",
                         style: TextStyle(color: AppColors.primary, fontSize: 12)
                       )
                     ],
                   )
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Content
            const Center(
              child: Text(
                'Maintenance LMS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            const Text(
              'Diinformasikan kepada seluruh pengguna LMS, kami dari tim IT akan melakukan maintenance pada tanggal 8 Desember 2025, untuk meningkatkan layanan server dalam menghadapi ujian akhir semester (UAS).',
              style: TextStyle(fontSize: 14, height: 1.6, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
             const Text(
              'Dengan adanya kegiatan maintenance tersebut maka situs LMS (lms.uimadura.ac.id) tidak dapat diakses mulai pukul 00.00 s/d 06.00 WIB.',
              style: TextStyle(fontSize: 14, height: 1.6, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
             const Text(
              'Demikian informasi ini kami sampaikan, mohon maaf atas ketidaknyamanannya.',
              style: TextStyle(fontSize: 14, height: 1.6, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            
            const SizedBox(height: 40),
            
            const Text(
              'Hormat Kami,\nAdmin LMS Universitas Islam Madura',
              style: TextStyle(fontSize: 14, height: 1.6, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Kelas Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
