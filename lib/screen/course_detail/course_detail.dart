import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/course_detail/widget/course_detail_screen_content.dart';
import 'package:quiz_flutter/screen/course_video/cubit/course_video_cubit.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => CourseDetailScreenState();
}

class CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late CourseDetailCubit _courseDetailCubit;

  @override
  void initState() {
    _courseDetailCubit = context.read<CourseDetailCubit>();
    _tabController = TabController(length: 2, vsync: this);
    onWidgetBuildDone(_handleCourseLesson);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onWidgetBuildDone(Function function) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      function();
    });
  }

  Future<void> _handleCourseLesson() async {
    await _courseDetailCubit.getCourseLesson();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailCubit, CourseDetailState>(
      builder: (context, state) {
        final Course course = state.course;
        context.read<CourseVideoCubit>().courseChanged(course);
        return CourseDetailScreenContent(
          course: course,
          courseLesson: state.courseLesson,
          tabController: _tabController,
        );
      },
    );
  }
}
