import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/course_list_screen/cubit/course_list_cubit.dart';
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
  Widget build(BuildContext context) {
    setState(() {
      context.read<CourseListCubit>().getCourse();
    });
    return BlocBuilder<CourseListCubit, CourseListState>(
      builder: (context, state) {
        if (state.status == CourseListStatus.isNotEmpty) {
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
                        CourseListView(course: state.courses),
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

class CourseListView extends StatelessWidget {
  const CourseListView({
    required this.course,
    super.key,
  });
  final List<Course> course;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimens.PADDING_SCREEN),
      child: ListView.builder(
        itemCount: course.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                context.read<CourseDetailCubit>().courseChanged(course[index]);
                BaseNavigation.push(context,
                    routeName: ManagerRoutes.courseDetailScreen);
              },
              child: CourseCardListView(course[index]));
        },
      ),
    );
  }
}
