import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/course_screen/cubit/course_screen_cubit.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/course_card_listview.dart';
import 'package:quiz_flutter/widgets/search_view.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
    context.read<CourseScreenCubit>().getCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseScreenCubit, CourseScreenState>(
      builder: (context, state) {
        if (state.status == CourseScreenStatus.isNotEmpty) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 70),
                        const SearchView(),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Dimens.PADDING_SCREEN),
                          child: ListView.builder(
                            itemCount: state.courses.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<CourseDetailCubit>()
                                      .courseChanged(state.courses[index]);
                                  context
                                      .read<CourseDetailCubit>()
                                      .isFullChanged(true);
                                  BaseNavigation.push(context,
                                      routeName:
                                          ManagerRoutes.courseDetailScreen);
                                },
                                child: CourseCardListView(state.courses[index]),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 70),
                      ],
                    ),
                    const TitleScreen(title: "Course"),
                    BuildBackButton(top: 24),
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
