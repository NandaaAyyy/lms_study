import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'course_detail_page.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> courses = [
      {
        'title': 'Desain Antarmuka & Pengalaman Pengguna',
        'code': 'UI/UX (3 SKS)',
        'progress': 0.7,
        'color': Colors.orange,
        'icon': 'UI/UX',
        'image': 'assets/images/ui.jpg',
      },
      {
        'title': 'Pendidikan Kewarganegaraan',
        'code': 'PKN (2 SKS)',
        'progress': 0.4,
        'color': Colors.red,
        'icon': 'PKN',
        'image': 'assets/images/pkn.jpg',
      },
      {
        'title': 'Sistem Operasi',
        'code': 'SO (3 SKS)',
        'progress': 0.85,
        'color': Colors.blueAccent,
        'icon': 'SO',
        'image': 'assets/images/so.jpg',
      },
      {
        'title': 'Pemrograman Perangkat Bergerak',
        'code': 'MOB (4 SKS)',
        'progress': 0.2,
        'color': Colors.purple,
        'icon': 'MOB',
        'image': 'assets/images/mobile.jpg',
      },
      {
        'title': 'Basis Data Lanjut',
        'code': 'BDL (3 SKS)',
        'progress': 0.5,
        'color': Colors.teal,
        'icon': 'DB',
        'image': 'assets/images/so.jpg',
      },
      {
        'title': 'Kecerdasan Buatan',
        'code': 'AI (3 SKS)',
        'progress': 0.1,
        'color': Colors.indigo,
        'icon': 'AI',
        'image': 'assets/images/ui.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: courses.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return _CourseCard(course: courses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 24),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: const Row(
        children: [
          Icon(Icons.school, color: Colors.white, size: 28),
          SizedBox(width: 12),
          Text(
            'Kelas Saya',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// ============================
/// COURSE CARD WIDGET
/// ============================
class _CourseCard extends StatelessWidget {
  final Map<String, dynamic> course;

  const _CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CourseDetailPage(
              courseTitle: course['title'],
              courseCode: course['code'],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            _CourseImage(course: course),
            const SizedBox(width: 16),
            Expanded(child: _CourseInfo(course: course)),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

/// ============================
/// IMAGE SECTION
/// ============================
class _CourseImage extends StatelessWidget {
  final Map<String, dynamic> course;

  const _CourseImage({required this.course});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        course['image'],
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return Container(
            width: 60,
            height: 60,
            color: course['color'].withOpacity(0.1),
            alignment: Alignment.center,
            child: Text(
              course['icon'],
              style: TextStyle(
                color: course['color'],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ============================
/// INFO SECTION
/// ============================
class _CourseInfo extends StatelessWidget {
  final Map<String, dynamic> course;

  const _CourseInfo({required this.course});

  @override
  Widget build(BuildContext context) {
    final progress = course['progress'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          course['code'],
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          course['title'],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: Colors.grey.shade200,
            valueColor:
                const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '${(progress * 100).toInt()}% Selesai',
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
