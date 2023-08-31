import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => CourseDetailScreenState();
}

class CourseDetailScreenState extends State<CourseDetailScreen> {
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
                Container(
                  height: 242,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
                  ),
                ),
                const Row(
                  children: [
                    Text('HydraCoder'),
                    Spacer(),
                    Icon(Icons.star, size: 14, color: AppColors.star),
                    Icon(Icons.star, size: 14, color: AppColors.star),
                    Icon(Icons.star, size: 14, color: AppColors.star),
                    Icon(Icons.star, size: 14, color: AppColors.star),
                    Icon(Icons.star, size: 14, color: AppColors.star),
                    Text('5.0'),
                  ],
                ),
                Text('Flutter for begginer', style: TxtStyle.h2),
                Row(
                  children: [
                    Text('11h11 / 18 Lesson', style: TxtStyle.labelStyle),
                    const SizedBox(width: 18),
                    Text('\$ 111,11', style: TxtStyle.labelMain),
                    Text(' / ', style: TxtStyle.labelStyle),
                    Text('\$ 999,99', style: TxtStyle.lineThrough),
                  ],
                ),
                Text('About This Course', style: TxtStyle.title)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
