import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'quiz_start_page.dart';

class CourseDetailPage extends StatefulWidget {
  final String courseTitle;
  final String courseCode;
  
  const CourseDetailPage({
    super.key,
    required this.courseTitle,
    required this.courseCode,
  });

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.courseTitle,
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: AppColors.primary, // Red background
        foregroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            color: AppColors.primary, // Keep red background behind container
            padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3.0, color: Colors.black),
                  insets: EdgeInsets.symmetric(horizontal: 30.0),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                tabs: const [
                  Tab(text: 'Lampiran Materi'),
                  Tab(text: 'Tugas dan Kuis'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildMateriTab(),
            _buildTugasDanKuisTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMateriTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Pengantar User Interface Design',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Deskripsi',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetapi pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience',
            style: TextStyle(fontSize: 12, height: 1.5, color: Colors.black87),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          
          _buildMaterialItem(
            'Sistem Informasi Mahasiswa Akademik',
            Icons.link,
            onTap: () async {
              const url = 'https://simat.uim.ac.id/';
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                // Handling error or just ignored for now as per simple req
                debugPrint('Could not launch $url');
              }
            },
          ),
          _buildMaterialItem('Pengantar User Interface Design', Icons.description_outlined),
          _buildMaterialItem('Empat Teori Dasar Antarmuka Pengguna', Icons.description_outlined),
          _buildMaterialItem('Empat Teori Dasar Antarmuka Pengguna', Icons.description_outlined),
          _buildMaterialItem('User Interface Design for Beginner', Icons.picture_as_pdf_outlined),
          _buildMaterialItem('20 Prinsip Desain', Icons.link),
          _buildMaterialItem('Best Practice UI Design', Icons.link),
        ],
      ),
    );
  }

  Widget _buildMaterialItem(String title, IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.black87),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.check_circle, color: Colors.green, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTugasDanKuisTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildTaskCard(
          context,
          type: 'QUIZ',
          title: 'Quiz Review 01',
          date: '26 Februari 2021 23:59 WIB',
          isDone: true,
          onTap: () {
            // Navigate to QuizStartPage
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => const QuizStartPage()),
             );
          },
        ),
        _buildTaskCard(
          context,
          type: 'TUGAS',
          title: 'Tugas 01 - UID Android Mobile Game',
          date: '26 Februari 2021 23:56 WIB',
          isDone: false, // Pending icon check default grey
          onTap: () {},
        ),
        _buildTaskCard(
          context,
          type: 'QUIZ',
          title: 'Kuis - Assessment 2',
          date: '25 Februari 2021 23:55 WIB',
          isDone: true,
          onTap: () {},
        ),
      ],
    );
  }
  
  Widget _buildTaskCard(BuildContext context, {
    required String type, 
    required String title, 
    required String date, 
    required bool isDone,
    required VoidCallback onTap,
  }) {
    bool isQuiz = type == 'QUIZ';
    Color labelColor = isQuiz ? Colors.blue.shade400 : Colors.blue.shade300; // Adjust colors
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
             BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0,2))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Label (Quiz/Tugas)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: labelColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isQuiz ? 'QUIZ' : 'Tugas',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                // Status Icon
                Icon(
                   Icons.check_circle, 
                   color: isDone ? Colors.green : Colors.grey.shade300,
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  isQuiz ? Icons.quiz_outlined : Icons.assignment_outlined,
                  size: 32,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Tanggal Waktu : $date',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
