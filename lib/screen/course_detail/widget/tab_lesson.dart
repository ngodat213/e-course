import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/models/course_lesson.dart';
import 'package:quiz_flutter/models/course_video.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/skeleton_widget.dart';

class TabLesson extends StatefulWidget {
  const TabLesson({
    super.key,
    required this.courseLesson,
    required this.onPressedLesson,
  });
  final List<CourseLesson> courseLesson;
  final Function(CourseLesson lesson, CourseVideo video) onPressedLesson;

  @override
  State<TabLesson> createState() => _TabLessonState();
}

class _TabLessonState extends State<TabLesson> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailCubit, CourseDetailState>(
      builder: (context, state) {
        if (state.status == CourseDetail.isNotEmpty) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 28),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.courseLesson.length,
              itemBuilder: (context, index) {
                final lesson = state.courseLesson[index];

                List<CourseVideo> listVideo = [];
                listVideo =
                    context.read<CourseDetailCubit>().getVideoByLesson(lesson);

                if (listVideo.isEmpty) {
                  return _tabbarLessonSkeletonContent(context);
                } else {
                  return _tabbarLessonContent(context, lesson, listVideo);
                }
              },
            ),
          );
        } else if (state.status == CourseDetail.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Container _tabbarLessonContent(
      BuildContext context, CourseLesson lesson, List<CourseVideo> video) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${S.of(context).section} ${lesson.selection} - ${lesson.title}',
            style: TxtStyle.hintStyle.copyWith(fontWeight: FontWeight.w600),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: lesson.listCourseVideo.length,
            itemBuilder: (context, index) {
              return _lessonButton(context, lesson, video[index]);
            },
          ),
        ],
      ),
    );
  }

  Container _tabbarLessonSkeletonContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Skeleton(width: 80),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Skeleton(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  GestureDetector _lessonButton(
      BuildContext context, CourseLesson lesson, CourseVideo video) {
    return GestureDetector(
      onTap: () {
        widget.onPressedLesson.call(lesson, video);
      },
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
            boxShadow: AppColors.shadow),
        child: Row(
          children: [
            SizedBox(
              width: Dimens.HEIGHT_30,
              height: Dimens.HEIGHT_30,
              child: Center(
                child: Text(video.part,
                    style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(video.title,
                    style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600)),
                const Expanded(child: SizedBox()),
                Text('${video.hour}hour ${video.minute}min',
                    style: TxtStyle.p.copyWith(color: AppColors.label)),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(Images.iconCheckPadding),
          ],
        ),
      ),
    );
  }
}
