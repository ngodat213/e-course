import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/course_card_listview.dart';
import 'package:quiz_flutter/widgets/search_view.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Course List', style: TxtStyle.h2),
                const SearchView(),
                Text('Best sell course', style: TxtStyle.h3),
                const SizedBox(height: 10),
                const CourseCardListView(),
                const CourseCardListView(),
                const CourseCardListView(),
                const SizedBox(height: 32),
                Text('Best sell course', style: TxtStyle.h3),
                const SizedBox(height: 10),
                const CourseCardListView(),
                const CourseCardListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
