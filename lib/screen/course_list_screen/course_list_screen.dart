import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/course_list_screen/cubit/course_list_screen_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/course_card_listview.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  late List<Course> courseList;
  List<Course> found = [];
  @override
  void initState() {
    super.initState();
    loadCourses();
  }

  Future<void> loadCourses() async {
    setState(() {
      courseList = context.read<CourseListScreenCubit>().courses;
      found = courseList;
    });
  }

  void _runFilter(String value) {
    List<Course> res = [];
    if (value.isEmpty) {
      res = courseList;
    } else {
      res = courseList
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      found = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseListScreenCubit, CourseListScreenState>(
      builder: (context, state) {
        if (state.status == CourseListScreenStatus.isNotEmpty) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 70),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 25),
                          decoration: BoxDecoration(
                            boxShadow: AppColors.shadow,
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.circular(Dimens.RADIUS_6),
                          ),
                          child: TextFormField(
                            onChanged: (value) => _runFilter(value),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 17),
                              prefixIcon: const Icon(Icons.search),
                              hintText: S.of(context).searchTitle,
                              hintStyle: TxtStyle.description,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Dimens.PADDING_SCREEN),
                          child: ListView.builder(
                            itemCount: found.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<CourseDetailCubit>()
                                      .courseChanged(found[index]);
                                  context
                                      .read<CourseDetailCubit>()
                                      .isFullChanged(true);
                                  BaseNavigation.push(context,
                                      routeName:
                                          ManagerRoutes.courseDetailScreen);
                                },
                                child: CourseCardListView(found[index]),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 70),
                      ],
                    ),
                    BuildBackButton(top: 24),
                    TitleScreen(title: S.of(context).course),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
