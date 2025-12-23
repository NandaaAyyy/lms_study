import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'quiz_page.dart';

class QuizStartPage extends StatelessWidget {
  const QuizStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Review 1'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis.\nJangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.',
              textAlign: TextAlign.justify,
              style: TextStyle(height: 1.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'Kerjakan sebelum hari Jum\'at, 31 Desember 2025 jam 23.59 WIB.',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Info Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                children: [
                  Text(
                    'Kuis Akan di tutup pada Jumat, 31 Desember 2025, 11:59 PM',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Batas Waktu: 15 menit',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Metode Penilaian: Nilai Tertinggi',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            
            // Usage History Header
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Percobaan Yang Sudah Di Lakukan',
                 style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            
            // Header Row
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                   Expanded(flex: 2, child: Text('Status', style: TextStyle(color: Colors.white, fontSize: 12))),
                   Expanded(flex: 1, child: Text('Nilai / 100.00', style: TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center)),
                   Expanded(flex: 1, child: Text('Tinjau Kembali', style: TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.end)),
                ],
              ),
            ),
            
            // Data Row
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border(
                  left: BorderSide(color: Colors.grey.shade300),
                  right: BorderSide(color: Colors.grey.shade300),
                  bottom: BorderSide(color: Colors.grey.shade300),
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Expanded(
                     flex: 2, 
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Selesai', style: TextStyle(fontWeight: FontWeight.bold)),
                         Text('Dikirim Pada Kamis, 26 Desember 2025 10:40', style: TextStyle(fontSize: 10, color: Colors.grey)),
                       ],
                     )
                   ),
                   const Expanded(flex: 1, child: Text('85.0', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                   Expanded(
                     flex: 1, 
                     child: Text(
                       'Lihat', 
                       textAlign: TextAlign.end, 
                       style: TextStyle(color: Colors.blue.shade700, fontWeight: FontWeight.bold)
                     )
                   ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Text(
              'Nilai Akhir Anda Untuk Kuis Ini Adalah 85.0 / 100.00',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),

            const SizedBox(height: 48),

            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const QuizPage()),
                   );
                },
                style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.grey.shade100,
                   foregroundColor: Colors.black,
                   elevation: 0,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                   padding: const EdgeInsets.symmetric(vertical: 16)
                ),
                child: const Text('Ambil Kuis'),
              ),
            ),
            const SizedBox(height: 16),
             SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.grey.shade100,
                   foregroundColor: Colors.black,
                   elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                   padding: const EdgeInsets.symmetric(vertical: 16)
                ),
                child: const Text('Kembali Ke Kelas'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
