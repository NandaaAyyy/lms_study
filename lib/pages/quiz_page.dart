import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'quiz_result.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Dummy Data for Questions
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Radio button dapat digunakan untuk menentukan ?',
      'options': ['Jenis Kelamin', 'Alamat', 'Hobby', 'Riwayat Pendidikan', 'Umur'],
      'answer': 0, // Index of correct answer
    },
    {
      'question': 'Widget utama dalam Flutter untuk membuat layout adalah?',
      'options': ['Activity', 'View', 'Div', 'Widget', 'Component'],
      'answer': 3,
    },
     // Generate more dummy questions to fill 15
    for (int i = 3; i <= 15; i++)
       {
        'question': 'Pertanyaan dummy nomor $i untuk testing layout ?',
        'options': ['Pilihan A', 'Pilihan B', 'Pilihan C', 'Pilihan D', 'Pilihan E'],
        'answer': 0,
      }
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  // Store selected answer for each question: null if not answered
  final Map<int, int> _selectedAnswers = {};

  void _answerQuestion(int optionIndex) {
    setState(() {
      _selectedAnswers[_currentQuestionIndex] = optionIndex;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _submitQuiz();
    }
  }
  
  void _submitQuiz() {
    // Calculate Score
    int score = 0;
    _selectedAnswers.forEach((index, answer) {
       if (answer == _questions[index]['answer']) {
         score++;
       }
    });

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultPage(
            score: score,
            totalQuestions: _questions.length,
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Review 1'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        actions: [
          Container(
             margin: const EdgeInsets.only(right: 16),
             child: const Row(
               children: [
                 Icon(Icons.timer_outlined, size: 20),
                 SizedBox(width: 4),
                 Text('15 : 00', style: TextStyle(fontWeight: FontWeight.bold)),
               ],
             )
          )
        ],
      ),
      body: Column(
        children: [
          // Question Navigator (Horizontal List)
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: _questions.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                bool isCurrent = index == _currentQuestionIndex;
                bool isAnswered = _selectedAnswers.containsKey(index);
                
                return GestureDetector(
                   onTap: () {
                     setState(() {
                       _currentQuestionIndex = index;
                     });
                   },
                   child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCurrent ? Colors.grey.shade300 : Colors.white,
                      border: Border.all(
                        color: isAnswered ? AppColors.primary : Colors.grey.shade400,
                        width: 1.5
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                        color: isAnswered ? AppColors.primary : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Soal Nomor ${_currentQuestionIndex + 1} / ${_questions.length}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  
                  Text(
                    question['question'] as String,
                    style: const TextStyle(fontSize: 16),
                  ),
                  
                  const SizedBox(height: 32),
                  
                   ...List.generate((question['options'] as List).length, (index) {
                      final options = question['options'] as List;
                      final isSelected = _selectedAnswers[_currentQuestionIndex] == index;
                      final optionLabel = String.fromCharCode(65 + index); // A, B, C...

                      return GestureDetector(
                        onTap: () => _answerQuestion(index),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xffEF5350) : Colors.grey.shade100, // Light red for selected
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                               Text(
                                 '$optionLabel.', 
                                 style: TextStyle(
                                   fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                   color: isSelected ? Colors.white : Colors.black,
                                 ),
                               ),
                               const SizedBox(width: 16),
                               Expanded(
                                 child: Text(
                                   options[index] as String,
                                   style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.black,
                                   ),
                                 ),
                               )
                            ],
                          ),
                        ),
                      );
                   }),

                   const SizedBox(height: 24),
                   
                   Align(
                     alignment: Alignment.centerRight,
                     child: ElevatedButton(
                        onPressed: _nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade100,
                          foregroundColor: Colors.black,
                          elevation: 0,
                        ),
                        child: Text(_currentQuestionIndex == _questions.length -1 ? 'Submit' : 'Soal Selanjutnya'),
                     ),
                   )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
