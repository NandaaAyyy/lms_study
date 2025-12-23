import 'package:flutter/material.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kursus Saya')),
      body: const Center(child: Text('Halaman Kursus')),
    );
  }
}
