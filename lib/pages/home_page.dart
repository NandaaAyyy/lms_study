import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'course_list_page.dart';
import 'quiz_page.dart';
import 'profile_page.dart';
import 'announcement_page.dart';
import 'task_detail_page.dart';
import 'course_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages for Bottom Navigation
  final List<Widget> _pages = [
    const HomeBody(),     // Defined below
    const CourseListPage(),
    const QuizPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _selectedIndex == 3
          ? null
          : AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Halo,',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  const Text(
                    'NANDA AYU PRIMADIANI', // Mock User
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Chip(
                    avatar: const Icon(Icons.person,
                        size: 16, color: AppColors.primary),
                    label: const Text('Mahasiswa', style: TextStyle(fontSize: 12)),
                    backgroundColor: Colors.white,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                  ),
                )
              ],
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 80,
            ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Kelas Saya', // Matching "Course" intent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Notifikasi', // Using Quiz icon but typically Notifications or Task
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Tugas Yang Akan Datang" Section
          const Text(
            'Tugas Yang Akan Datang',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TaskDetailPage()),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tugas 01 - UID Android Mobile Game',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Waktu Pengumpulan\nJumat, 31 Desember 2025 23:59 WIB',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // "Pengumuman Terakhir" Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pengumuman Terakhir',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Lihat Semua', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AnnouncementPage()),
              );
            },
            child: Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    // Placeholder for Announcement Image
                    Container(
                      color: Colors.blue.shade50,
                      child: const Center(
                        child:
                            Icon(Icons.campaign, size: 50, color: Colors.blue),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Maintenance Pro LMS Semester Genap 2024/2025",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Diumumkan oleh Admin",
                              style: TextStyle(color: Colors.grey, fontSize: 11),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
          
          // "Progres Kelas" Section
          const Text(
            'Progres Kelas',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          
          // List of Course Progress
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: const [
              CourseProgressTile(
                title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                code: 'U123 (3 SKS)',
                progress: 0.7,
                color: Colors.orange,
                iconText: 'UI/UX',
              ),
              CourseProgressTile(
                title: 'PENDIDIKAN KEWARGANEGARAAN',
                code: 'U456 (2 SKS)',
                progress: 0.4,
                color: Colors.red,
                iconText: 'PKN',
              ),
              CourseProgressTile(
                title: 'SISTEM OPERASI',
                code: 'U789 (3 SKS)',
                progress: 0.85,
                color: Colors.blueAccent,
                iconText: 'SO',
              ),
              CourseProgressTile(
                title: 'PEMROGRAMAN PERANGKAT BERGERAK',
                code: 'U101 (4 SKS)',
                progress: 0.2,
                color: Colors.purple,
                iconText: 'MOB',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseProgressTile extends StatelessWidget {
  final String title;
  final String code;
  final double progress;
  final Color color;
  final String iconText;

  const CourseProgressTile({
    super.key,
    required this.title,
    required this.code,
    required this.progress,
    required this.color,
    required this.iconText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailPage(
              courseTitle: title,
              courseCode: code,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                iconText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 12),
            
            // Course Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    code,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 6,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${(progress * 100).toInt()}% Selesai',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
