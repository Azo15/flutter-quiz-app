import 'package:flutter/material.dart';

import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = score / totalQuestions;
    String feedback = percentage >= 0.8
        ? "Harika İş Çıkardın!"
        : percentage >= 0.5
            ? "Tebrikler, Fena Değil!"
            : "Biraz Daha Çalışmalısın.";

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quiz Tamamlandı!",
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
              Text(
                "Skorunuz: $score / $totalQuestions",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            const SizedBox(height: 20),
            Text(
              feedback,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF2575FC),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10,
                shadowColor: Colors.black.withOpacity(0.2),
              ),
              child: const Text(
                "Yeniden Başla",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
