import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
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
                const _courseContinute(),
                const _courseContinute(),
                const _courseContinute(),
                const SizedBox(height: 32),
                Text('Best sell course', style: TxtStyle.h3),
                const SizedBox(height: 10),
                const _courseContinute(),
                const _courseContinute(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _courseContinute extends StatelessWidget {
  const _courseContinute();

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
              borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
            ),
          ),
          SizedBox(
            width: 202,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Learning How To Write As A Professional Author',
                    style: TxtStyle.buttonBlack),
                const Expanded(child: SizedBox()),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xFFEDEDED)),
                    ),
                  ),
                  child: const _CourseInfo(),
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
  const _CourseInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(Images.iconLesson),
            const SizedBox(width: 8),
            Text('9 Lessons',
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
