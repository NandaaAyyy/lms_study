import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kuis & Notifikasi')),
      body: const Center(child: Text('Halaman Kuis')),
    );
  }
}
