import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/models/course_lesson.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/course_detail/widget/tab_review.dart';
import 'package:quiz_flutter/screen/course_detail/widget/tab_lesson.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/build_button.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';
import 'package:readmore/readmore.dart';

class CourseDetailScreenContent extends StatelessWidget {
  const CourseDetailScreenContent({
    super.key,
    required this.tabController,
    required this.course,
    required this.courseLesson,
  });
  final TabController tabController;
  final List<CourseLesson> courseLesson;
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white.withOpacity(0.1),
        margin: const EdgeInsets.symmetric(
            horizontal: Dimens.PADDING_SCREEN, vertical: Dimens.PADDING_SCREEN),
        child: _registerButton(context),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    _thumbCourse(context, course),
                    const SizedBox(height: 32),
                    _titleCourse(course),
                    _teacherInfo(course.teacher),
                    const SizedBox(height: 16),
                    _courseDescription(course, context),
                    const SizedBox(height: 32),
                    _tabbarCourseDetail(context, courseLesson),
                  ],
                ),
              ),
              _favoriteButton(context),
              TitleScreen(title: course.title),
              BuildBackButton(top: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerButton(BuildContext context) {
    return BuildButton(
      text: S.of(context).register,
      onTap: () {
        context.read<CourseDetailCubit>().updateCourse();
      },
    );
  }

  Widget _thumbCourse(BuildContext context, Course course) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(course.thumb),
          fit: BoxFit.cover,
        ),
        color: AppColors.main,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
      ),
    );
  }

  Widget _titleCourse(Course course) => Text(course.title, style: TxtStyle.h3);

  Widget _teacherInfo(String teacher) {
    return Row(
      children: [
        Text(
          "@$teacher",
          style: TxtStyle.pBold.copyWith(color: const Color(0xFF93989A)),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(Images.iconCheckMark),
      ],
    );
  }

  Widget _courseDescription(Course course, BuildContext context) {
    return ReadMoreText(
      course.description,
      trimLines: 2,
      trimCollapsedText: S.of(context).readmore,
      trimExpandedText: S.of(context).showless,
      style: TxtStyle.text.copyWith(color: const Color(0xFF93989A)),
    );
  }

  Widget _favoriteButton(BuildContext context) {
    return BlocBuilder<CourseDetailCubit, CourseDetailState>(
      builder: (context, state) {
        return Positioned(
          top: 24,
          right: 25,
          child: GestureDetector(
            onTap: () {
              context.read<CourseDetailCubit>().updateFavorite();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                boxShadow: AppColors.shadow,
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: state.favorite == false
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.grey,
                      size: 16,
                    )
                  : const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 16,
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _tabbarCourseDetail(
    BuildContext context,
    List<CourseLesson> courseLesson,
  ) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            unselectedLabelColor: AppColors.label,
            labelColor: Colors.black,
            indicatorColor: AppColors.white,
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.main,
                  width: 2.0,
                ),
              ),
            ),
            controller: tabController,
            tabs: [
              Tab(text: S.of(context).lesson),
              Tab(text: S.of(context).review),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                TabLesson(courseLesson: courseLesson),
                const TabReview(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
