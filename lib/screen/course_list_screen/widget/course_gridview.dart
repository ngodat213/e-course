import 'package:flutter/material.dart';
import 'package:quiz_flutter/screen/course_list_screen/widget/course_card_grid.dart';

class CourseGridView extends StatelessWidget {
  const CourseGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 279,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 25),
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
