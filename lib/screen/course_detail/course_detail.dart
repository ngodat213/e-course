import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/course_detail/widget/tab_review.dart';
import 'package:quiz_flutter/screen/course_detail/widget/tab_lesson.dart';
import 'package:quiz_flutter/screen/course_video/cubit/course_video_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/build_button.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';
import 'package:readmore/readmore.dart';
import 'package:chewie/chewie.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => CourseDetailScreenState();
}

class CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<CourseDetailCubit>().getCourseLesson();
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailCubit, CourseDetailState>(
      builder: (context, state) {
        final course = state.course;
        context.read<CourseVideoCubit>().courseChanged(course);
        return Scaffold(
          bottomNavigationBar: Container(
            color: Colors.white.withOpacity(0.1),
            margin: const EdgeInsets.symmetric(
                horizontal: Dimens.PADDING_SCREEN,
                vertical: Dimens.PADDING_SCREEN),
            child: BuildButton(
              text: 'Register',
              onTap: () {
                context.read<CourseDetailCubit>().updateCourse();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(course.thumb),
                              fit: BoxFit.cover,
                            ),
                            color: AppColors.main,
                            borderRadius:
                                BorderRadius.circular(Dimens.RADIUS_8),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(course.title, style: TxtStyle.h3),
                        _typeWidget(course),
                        const SizedBox(height: 16),
                        ReadMoreText(
                          course.description,
                          trimLines: 2,
                          style: TxtStyle.text
                              .copyWith(color: const Color(0xFF93989A)),
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          height: 1000,
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
                                controller: _tabController,
                                tabs: const [
                                  Tab(text: 'Lesson'),
                                  Tab(text: 'Review'),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _tabController,
                                  children: const [
                                    TabLesson(),
                                    TabReview(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  TitleScreen(title: course.title),
                  BuildBackButton(top: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _typeWidget extends StatelessWidget {
  const _typeWidget(this.course);
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "@mftmkkus",
              style: TxtStyle.pBold.copyWith(color: const Color(0xFF93989A)),
            ),
            const SizedBox(width: 4),
            SvgPicture.asset(Images.iconCheckMark),
          ],
        ),
        Row(
          children: [
            Text(course.ratting.toString(), style: TxtStyle.rating),
            const SizedBox(width: 4),
            SvgPicture.asset(Images.iconStar, width: 12),
            SvgPicture.asset(Images.iconStar, width: 12),
            SvgPicture.asset(Images.iconStar, width: 12),
            SvgPicture.asset(Images.iconStar, width: 12),
            SvgPicture.asset(Images.iconStar, width: 12),
            const SizedBox(width: 4),
            Text("(${course.register})", style: TxtStyle.labelStyle),
          ],
        ),
      ],
    );
  }
}
