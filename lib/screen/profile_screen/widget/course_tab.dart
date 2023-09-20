import 'package:flutter/material.dart';
import 'package:quiz_flutter/widgets/course_card.dart';

class CourseTab extends StatefulWidget {
  const CourseTab({super.key});

  @override
  State<CourseTab> createState() => _CourseTabState();
}

class _CourseTabState extends State<CourseTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      child: const Column(
        children: [
          CourseCard(),
          CourseCard(),
          CourseCard(),
        ],
      ),
    );
  }
}
