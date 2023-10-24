import 'package:flutter/material.dart';
import 'package:quiz_flutter/screen/home_screen/widget/exam_done.dart';

class QuizTab extends StatefulWidget {
  const QuizTab({super.key});

  @override
  State<QuizTab> createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      child: const Column(
        children: [
          ExamDone(),
          ExamDone(),
          ExamDone(),
          ExamDone(),
          ExamDone(),
        ],
      ),
    );
  }
}
