import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
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
           style: const TextStyle(fontSize: 16),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60), // Space for custom container
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
                 ]
               ),
               child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white, // Inverted logic: selected usually has color? 
                  // UX Image shows: "indicator" is likely an underline OR the whole pill is selected.
                  // Let's look at the image: It has a WHITE background for the tab bar, and a thick black underline for selected?
                  // Or maybe it's a pill tab. 
                  // "Materi" vs "Tugas Dan Kuis" (Underlined in image)
                  border: const Border(bottom: BorderSide(color: Colors.black, width: 3))
                ),
                indicatorColor: Colors.black,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: 'Materi'),
                  Tab(text: 'Tugas Dan Kuis'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMateriTab(),
          _buildTugasDanKuisTab(context),
        ],
      ),
    );
  }

  Widget _buildMateriTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           // Course Info
           Container(
             padding: const EdgeInsets.all(16),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(12),
               border: Border.all(color: Colors.grey.shade200),
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(widget.courseCode, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                 const SizedBox(height: 8),
                 Text('Dosen: Dr. Budi Santoso, M.Kom', style: TextStyle(color: Colors.grey.shade700)),
               ],
             )
           ),
           const SizedBox(height: 24),
           
           const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Mata kuliah ini mempelajari prinsip-prinsip desain antarmuka pengguna (UI) dan pengalaman pengguna (UX).',
              style: TextStyle(color: AppColors.textSecondary, height: 1.5),
            ),
            
            const SizedBox(height: 24),
            
            const Text(
              'Daftar Materi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 0,
                  color: Colors.grey.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                    title: Text('Pertemuan ${index + 1}'),
                    subtitle: const Text('PDF • 2 MB'),
                    trailing: const Icon(Icons.download),
                  ),
                );
              },
            )
        ],
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
