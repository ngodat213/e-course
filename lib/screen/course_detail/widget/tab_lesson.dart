import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class TabLesson extends StatefulWidget {
  const TabLesson({super.key});

  @override
  State<TabLesson> createState() => _TabLessonState();
}

class _TabLessonState extends State<TabLesson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 28),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Lesson(),
            Lesson(),
            Lesson(),
          ],
        ),
      ),
    );
  }
}

class Lesson extends StatelessWidget {
  const Lesson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Section 1 - Introductions',
          style: TxtStyle.hintStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
              boxShadow: AppColors.shadow),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('01',
                  style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Introducing to The Class',
                      style:
                          TxtStyle.text.copyWith(fontWeight: FontWeight.w600)),
                  const Expanded(child: SizedBox()),
                  Text('10min 34s',
                      style: TxtStyle.p.copyWith(color: AppColors.label)),
                ],
              ),
              SvgPicture.asset(Images.iconCheckPadding),
            ],
          ),
        ),
        const SizedBox(height: 12)
      ],
    );
  }
}
