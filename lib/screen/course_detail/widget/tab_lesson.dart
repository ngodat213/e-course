import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/models/course_lesson.dart';
import 'package:quiz_flutter/models/course_video.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/course_video/cubit/course_video_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class TabLesson extends StatefulWidget {
  const TabLesson({super.key});

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
                return LessonWidget(
                  lesson: lesson,
                  video: state.courseVideo,
                );
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
}

class LessonWidget extends StatefulWidget {
  const LessonWidget({
    super.key,
    required this.lesson,
    required this.video,
  });

  final CourseLesson lesson;
  final List<CourseVideo> video;
  @override
  State<LessonWidget> createState() => _LessonWidgetState();
}

class _LessonWidgetState extends State<LessonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailCubit, CourseDetailState>(
      builder: (context, state) {
        if (state.status == CourseDetail.isNotEmpty) {
          return Container(
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Section ${widget.lesson.selection} - ${widget.lesson.title}',
                  style:
                      TxtStyle.hintStyle.copyWith(fontWeight: FontWeight.w600),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.courseVideo.length,
                  itemBuilder: (context, index) {
                    return LessonContent(
                      video: state.courseVideo[index],
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class LessonContent extends StatefulWidget {
  const LessonContent({
    super.key,
    required this.video,
  });
  final CourseVideo video;

  @override
  State<LessonContent> createState() => _LessonContentState();
}

class _LessonContentState extends State<LessonContent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CourseVideoCubit>().videoUrlChanged(widget.video.video);
        context
            .read<CourseVideoCubit>()
            .courseChanged(context.read<CourseDetailCubit>().state.course);
        BaseNavigation.push(context,
            routeName: ManagerRoutes.courseVideoScreen);
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
                child: Text(widget.video.part,
                    style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.video.title,
                    style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600)),
                const Expanded(child: SizedBox()),
                Text('${widget.video.hour}hour ${widget.video.minute}min',
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
