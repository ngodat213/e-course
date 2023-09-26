import 'package:flutter/material.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/home_screen/widget/course_slider.dart';
import 'package:quiz_flutter/screen/home_screen/widget/grid_course.dart';
import 'package:quiz_flutter/screen/home_screen/widget/home_header.dart';
import 'package:quiz_flutter/screen/home_screen/widget/list_exam.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/search_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(
                  Dimens.PADDING_SCREEN,
                  Dimens.PADDING_18,
                  Dimens.PADDING_SCREEN,
                  Dimens.PADDING_ZERO,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeader(),
                    const SearchView(),
                    Text('${S.of(context).hi}, HydraCoder',
                        style: TxtStyle.title),
                    const SizedBox(height: Dimens.HEIGHT_8),
                    Text(S.of(context).progressTitle,
                        style: TxtStyle.hintStyle),
                  ],
                ),
              ),
              const CourseSlider(),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: Dimens.PADDING_SCREEN,
                  vertical: Dimens.PADDING_16,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridViewCourse(),
                    SizedBox(height: Dimens.HEIGHT_20),
                    ListExam(),
                    SizedBox(height: Dimens.HEIGHT_20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
