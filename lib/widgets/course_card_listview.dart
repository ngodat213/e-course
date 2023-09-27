import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class CourseCardListView extends StatelessWidget {
  const CourseCardListView(this.course, {super.key});
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: AppColors.shadow,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
      ),
      child: Row(
        children: [
          Container(
            width: 108,
            height: 108,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: AppColors.main,
              image: DecorationImage(
                  image: NetworkImage(course.thumb), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
            ),
          ),
          SizedBox(
            width: 202,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.title, style: TxtStyle.buttonBlack),
                const Expanded(child: SizedBox()),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xFFEDEDED)),
                    ),
                  ),
                  child: _CourseInfo(course),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: AppColors.main,
                        borderRadius:
                            BorderRadius.circular(Dimens.RADIUS_CIRCLE),
                      ),
                    ),
                    Text('HydraCoder', style: TxtStyle.labelStyle)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CourseInfo extends StatelessWidget {
  const _CourseInfo(this.course);
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(Images.iconLesson),
            const SizedBox(width: 8),
            Text('${course.listLesson.length} Lessons',
                style: TxtStyle.time.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(Images.iconLesson),
            const SizedBox(width: 8),
            Text('78 hrs 30 mins',
                style: TxtStyle.time.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}
