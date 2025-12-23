import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'course_detail_page.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final List<Map<String, dynamic>> courses = [
      {
        'title': 'Desain Antarmuka & Pengalaman Pengguna',
        'code': 'UI/UX (3 SKS)',
        'progress': 0.7,
        'color': Colors.orange,
        'icon': 'UI/UX',
      },
      {
        'title': 'Pendidikan Kewarganegaraan',
        'code': 'PKN (2 SKS)',
        'progress': 0.4,
        'color': Colors.red,
        'icon': 'PKN',
      },
      {
        'title': 'Sistem Operasi',
        'code': 'SO (3 SKS)',
        'progress': 0.85,
        'color': Colors.blueAccent,
        'icon': 'SO',
      },
      {
        'title': 'Pemrograman Perangkat Bergerak',
        'code': 'MOB (4 SKS)',
        'progress': 0.2,
        'color': Colors.purple,
        'icon': 'MOB',
      },
      {
        'title': 'Basis Data Lanjut',
        'code': 'BDL (3 SKS)',
        'progress': 0.5,
        'color': Colors.teal,
        'icon': 'DB',
      },
      {
        'title': 'Kecerdasan Buatan',
        'code': 'AI (3 SKS)',
        'progress': 0.1,
        'color': Colors.indigo,
        'icon': 'AI',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          // Custom Header
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
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
          ),
          
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _buildCourseCard(context, course),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, Map<String, dynamic> course) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailPage(
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
            // Icon Box
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: course['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                course['icon'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: course['color'],
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 16),
            
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['code'],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    course['title'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Progress
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: course['progress'],
                      minHeight: 6,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${(course['progress'] * 100).toInt()}% Selesai',
                        style: const TextStyle(fontSize: 10, color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
