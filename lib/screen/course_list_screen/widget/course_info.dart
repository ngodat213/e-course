import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class CourseInfo extends StatelessWidget {
  const CourseInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Video Production Bootcamp: Videography'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: AppColors.grey)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(Images.iconLesson),
                  const SizedBox(width: 8),
                  Text(
                    '9 Lessons',
                    style: TxtStyle.time.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(Images.iconLesson),
                  const SizedBox(width: 8),
                  Text(
                    '78 hrs 30 mins',
                    style: TxtStyle.time.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
              ),
            ),
            Text('HydraCoder', style: TxtStyle.labelStyle)
          ],
        ),
      ],
    );
  }
}
