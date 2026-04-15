import 'dart:async';
import 'package:flutter/material.dart';
import '../models/question.dart';
import '../data/questions_db.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int timeLeft = 15;
  Timer? timer;
  bool showCorrectAnswer = false;
  int? selectedOptionIndex;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    timeLeft = 15;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          t.cancel();
          handleAnswerOptionClick(null); // Time out acts as wrong answer
        }
      });
    });
  }

  void handleAnswerOptionClick(int? optionIndex) {
    timer?.cancel();
    setState(() {
      showCorrectAnswer = true;
      selectedOptionIndex = optionIndex;
    });

    if (optionIndex == questionsDb[currentQuestionIndex].correctOptionIndex) {
      score++;
    }

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        showCorrectAnswer = false;
        selectedOptionIndex = null;
        if (currentQuestionIndex < questionsDb.length - 1) {
          currentQuestionIndex++;
          startTimer();
        } else {
          // Go to Result Screen
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => ResultScreen(
                score: score,
                totalQuestions: questionsDb.length,
                onRestart: restartQuiz,
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
        }
      });
    });
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const QuizScreen()),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = questionsDb[currentQuestionIndex];
    final isPulseTime = timeLeft <= 5; // Pulse animation when 5s or less

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz Uygulaması",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF1E1B4B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Soru ${currentQuestionIndex + 1}/${questionsDb.length}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFA5B4FC), // Indigo 200
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isPulseTime ? Colors.red.withOpacity(0.2) : Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isPulseTime ? Colors.redAccent : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    "Kalan Süre: $timeLeft",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isPulseTime ? Colors.redAccent : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.white.withOpacity(0.1)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Text(
                        question.text,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ...List.generate(question.options.length, (index) {
                      bool isSelected = selectedOptionIndex == index;
                      bool isCorrect = index == question.correctOptionIndex;
                      
                      Color getButtonColor() {
                        if (!showCorrectAnswer) return Colors.white.withOpacity(0.05);
                        if (isCorrect) return Colors.green.withOpacity(0.3);
                        if (isSelected && !isCorrect) return Colors.red.withOpacity(0.3);
                        return Colors.white.withOpacity(0.02);
                      }

                      Color getBorderColor() {
                        if (!showCorrectAnswer) return Colors.white.withOpacity(0.1);
                        if (isCorrect) return Colors.greenAccent;
                        if (isSelected && !isCorrect) return Colors.redAccent;
                        return Colors.transparent;
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: InkWell(
                          onTap: showCorrectAnswer ? null : () => handleAnswerOptionClick(index),
                          borderRadius: BorderRadius.circular(15),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                              color: getButtonColor(),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: getBorderColor(), width: 2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    question.options[index],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ),
                                if (showCorrectAnswer && isCorrect)
                                  const Icon(Icons.check_circle, color: Colors.greenAccent),
                                if (showCorrectAnswer && isSelected && !isCorrect)
                                  const Icon(Icons.cancel, color: Colors.redAccent),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
