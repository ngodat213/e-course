import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/course_screen/cubit/course_list_screen_cubit.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/course_card_listview.dart';
import 'package:quiz_flutter/widgets/search_view.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  @override
  void initState() {
    context.read<CourseListScreenCubit>().getCourse();
    super.initState();
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
