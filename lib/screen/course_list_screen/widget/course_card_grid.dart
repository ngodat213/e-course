import 'package:flutter/material.dart';
import 'package:quiz_flutter/screen/course_list_screen/widget/course_info.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';

class CourseCardGrid extends StatelessWidget {
  const CourseCardGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 230,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 2, bottom: 2, right: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppColors.shadow,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 210,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://photo2.tinhte.vn/data/attachment-files/2023/06/6471542_54505-110094-Apple-Siri-xl.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const CourseInfo(),
        ],
      ),
    );
  }
}
