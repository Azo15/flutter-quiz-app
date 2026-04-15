import 'package:flutter/material.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Uygulaması',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A), // Tailwind Slate 900
        primaryColor: const Color(0xFF6366F1), // Tailwind Indigo 500
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white, 
          displayColor: Colors.white,
          fontFamily: 'Roboto',
        ),
        useMaterial3: true,
      ),
      home: const QuizScreen(),
    );
  }
}
