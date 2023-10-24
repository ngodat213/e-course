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
                  Positioned(
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
      children: [
        Text(
          "@${course.teacher}",
          style: TxtStyle.pBold.copyWith(color: const Color(0xFF93989A)),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(Images.iconCheckMark),
      ],
    );
  }
}
