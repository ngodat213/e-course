import 'package:flutter/material.dart';
import 'package:quiz_flutter/screen/course_list_screen/widget/course_card_grid.dart';

class CourseGridView extends StatelessWidget {
  const CourseGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 259,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: const CourseCardGrid(),
          );
        },
      ),
    );
  }
}
