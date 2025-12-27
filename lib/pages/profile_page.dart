import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
// removed unused import: auth/login_page.dart
import 'course_detail_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1); // "Kelas" is middle tab (index 1)
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Section
          Stack(
            alignment: Alignment.center,
            children: [
              // Red Background
              Container(
                height: 320, // Adjust height to fit everything
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              
              // Profile Info
              Positioned(
                top: 60,
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        image: const DecorationImage(
                          image: AssetImage('images/yoona.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'NANDA AYU PRIMADIANI',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              // Floating TabBar
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width - 48, // Margin 24 each side
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    tabs: const [
                       Tab(text: 'About Me'),
                       Tab(text: 'Kelas'),
                       Tab(text: 'Edit Profile'),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAboutMeTab(), // Placeholder
                _buildKelasTab(),   // The requested implementation
                _buildEditProfileTab(), // Placeholder
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutMeTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      children: [
        _buildSectionHeader('Informasi User'),
        const SizedBox(height: 12),
        _buildInfoItem(
          label: 'Email address',
          value: 'nandaayuprimad@365.uimadura.ac.id',
        ),
        _buildInfoItem(
          label: 'Program Studi',
          value: 'S1 Teknik Informatika',
        ),
        _buildInfoItem(
          label: 'Fakultas',
          value: 'Fakultas Ilmu Komputer',
        ),
        
        const SizedBox(height: 20),
        
        _buildSectionHeader('Aktivitas Login'),
        const SizedBox(height: 12),
        _buildInfoItem(
          label: 'First access to site',
          value: '2025-12-27 15:43:44',
        ),
        _buildInfoItem(
          label: 'Last access to site',
          value: '2025-12-27 15:43:44',
        ),

        const SizedBox(height: 40),

        Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             ElevatedButton.icon(
              onPressed: () {
                // Logout logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA91D34), // Dark red
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              icon: const Icon(Icons.logout, size: 20),
              label: const Text('Log Out'),
            ),
           ],
        ),
         const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildInfoItem({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditProfileTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      children: [
        _buildTextField(label: 'Nama Pertama'),
        _buildTextField(label: 'Nama Terakhir'),
        _buildTextField(label: 'E-mail Address'),
        _buildTextField(label: 'Negara'),
        _buildTextField(label: 'Deskripsi', maxLines: 5),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
              // Save logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200, // Light grey background like in image
              foregroundColor: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: const Text('Simpan'),
          ),
        ),
         const SizedBox(height: 40), // Bottom padding
      ],
    );
  }

  Widget _buildTextField({required String label, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKelasTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      children: [
        _buildClassItem(
          title: 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
          code: 'D4SM-41-GAB1 [ARS]',
          date: 'Monday, 8 February 2025',
        ),
        _buildClassItem(
          title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
          code: 'D4SM-42-03 [ADY]',
          date: 'Monday, 8 February 2025',
          onTap: () {
            // Link to relevant page if needed, e.g. CourseDetailPage
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => const CourseDetailPage(
                   courseTitle: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                   courseCode: 'D4SM-42-03 [ADY]',
                 ),
               ),
             );
          }
        ),
        _buildClassItem(
          title: 'KEWARGANEGARAAN',
          code: 'D4SM-41-GAB1 [BBO], Jumat 2',
          date: 'Friday, 8 February 2025',
        ),
        _buildClassItem(
           title: 'OLAH RAGA D3TT-44-02 [EYR]',
           code: 'Tanggal Mulai Monday, 8 February 2025'
        ),
         _buildClassItem(
           title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
           code: 'D4SM-43-04 [TPR]',
           date: 'Monday, 8 February 2025',
        ),
         _buildClassItem(
           title: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
           code: 'D4SM-41-GAB1 [APJ]',
           date: 'Monday, 8 February 2025',
        ),
         _buildClassItem(
           title: 'SISTEM OPERASI D4SM-44-02 [DDS]',
           code: 'Monday, 8 February 2025',
        ),
      ],
    );
  }

  Widget _buildClassItem({
    required String title,
    required String code,
    String? date,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blue Icon/Shape
            Container(
              width: 50,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    code,
                    style: const TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                   if (date != null) ...[
                     const SizedBox(height: 4),
                      Text(
                        'Tanggal Mulai $date',
                        style: const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                   ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
