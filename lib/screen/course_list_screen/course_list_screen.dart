import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/screen/course_list_screen/cubit/course_list_cubit.dart';
import 'package:quiz_flutter/screen/course_list_screen/widget/course_gridview.dart';
import 'package:quiz_flutter/screen/course_list_screen/widget/gridview_type.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
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
    return BlocBuilder<CourseListCubit, CourseListState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: Dimens.PADDING_SCREEN,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 70),
                        const SearchView(),
                        Text('Popular courses', style: TxtStyle.title),
                        const GridViewType(),
                        const CourseGridView(),
                        const SizedBox(height: 32),
                        Text('Recommend courses', style: TxtStyle.title),
                        const SizedBox(height: 20),
                        const CourseGridView(),
                        const SizedBox(height: 70),
                      ],
                    ),
                  ),
                  const TitleScreen(title: "Course"),
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
