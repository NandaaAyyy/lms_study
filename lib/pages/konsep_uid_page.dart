import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme/app_colors.dart';
import 'task_detail_page.dart';

class KonsepUIDPage extends StatefulWidget {
  const KonsepUIDPage({super.key});

  @override
  State<KonsepUIDPage> createState() => _KonsepUIDPageState();
}

class _KonsepUIDPageState extends State<KonsepUIDPage> with SingleTickerProviderStateMixin {
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
        title: const Text(
          'DESAIN ANTARMUKA & PENGALAMAN\nPENGGUNA D4SM-42-03 [ADY]',
          style: TextStyle(fontSize: 14),
          maxLines: 2,
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ]),
              child: TabBar(
                controller: _tabController,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3.0, color: Colors.black),
                  insets: EdgeInsets.symmetric(horizontal: 30.0),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
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
            _buildPlaceholderTab(),
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
              'Konsep User Interface Design',
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
            'Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari Interaction.',
            style: TextStyle(fontSize: 12, height: 1.5, color: Colors.black87),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),
          _buildMaterialItem(
            'Link Zoom Meeting Syncronous',
            Icons.link,
            onTap: () async {
              const url = 'https://simat.uim.ac.id/';
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                debugPrint('Could not launch $url');
              }
            },
          ),
          _buildMaterialItem('Elemen-elemen Antarmuka Pengguna', Icons.description_outlined),
          _buildMaterialItem('UID Guidelines and Principles', Icons.description_outlined),
          _buildMaterialItem('User Profile', Icons.description_outlined),
          _buildMaterialItem('Principles of User Interface DesignURL', Icons.link),
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

  Widget _buildPlaceholderTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTaskQuizItem(
            type: 'QUIZ',
            title: 'Quiz Review 01',
            date: 'Tanggal Waktu : 26 Februari 2021 23:59 WIB',
            icon: Icons.quiz_outlined,
            isCompleted: true,
            onTap: () {},
          ),
          _buildTaskQuizItem(
            type: 'Tugas',
            title: 'Tugas 01 - UID Android Mobile Game',
            date: 'Tanggal Waktu : 26 Februari 2021 23:56 WIB',
            icon: Icons.assignment_outlined,
            isCompleted: true, // Assuming consistency
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TaskDetailPage()),
              );
            },
            isGrayCheck: true,
          ),
           _buildTaskQuizItem(
            type: 'QUIZ',
            title: 'Kuis - Assessment 2',
            date: 'Tanggal Waktu : 25 Februari 2021 23:55 WIB',
            icon: Icons.quiz_outlined,
            isCompleted: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTaskQuizItem({
    required String type,
    required String title,
    required String date,
    required IconData icon,
    bool isCompleted = false,
    bool isGrayCheck = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
             BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    type,
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  Icons.check_circle, 
                  color: isGrayCheck ? Colors.grey.shade300 : Colors.green, 
                  size: 24
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 28, color: Colors.black87),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
