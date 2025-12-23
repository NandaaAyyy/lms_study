import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'home_page.dart';

class QuizResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const QuizResultPage({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    bool isPassed = score >= (totalQuestions * 0.7).toInt(); // 70% passing grade

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Hasil Kuis'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // Prevent back button to quiz
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Result Icon
              Icon(
                isPassed ? Icons.check_circle : Icons.cancel,
                size: 100,
                color: isPassed ? AppColors.success : AppColors.error,
              ),
              const SizedBox(height: 24),
              
              const Text(
                'Skor Anda',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                '$score / $totalQuestions',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              
              Text(
                isPassed ? 'Selamat! Anda Lulus' : 'Belum Lulus, Coba Lagi!',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              
              const SizedBox(height: 48),
              
              // Back to Home Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to Home, clearing navigation stack
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false,
                    );
                  },
                  child: const Text('Kembali ke Beranda'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
