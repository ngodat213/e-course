import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/screen/home_screen/widget/course_slider.dart';
import 'package:quiz_flutter/screen/home_screen/widget/grid_course.dart';
import 'package:quiz_flutter/screen/home_screen/widget/home_header.dart';
import 'package:quiz_flutter/screen/home_screen/widget/list_exam.dart';
import 'package:quiz_flutter/screen/home_screen/widget/menu_drawer.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController carouselController = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: const MenuDrawer(),
      appBar: _homeAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CourseSlider(carouselController: carouselController),
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

  AppBar _homeAppBar() {
    return AppBar(
      elevation: 0,
      titleSpacing: Dimens.PADDING_SCREEN,
      title: const HomeHeader(),
      iconTheme: const IconThemeData(color: AppColors.label),
      backgroundColor: AppColors.white,
    );
  }
}
