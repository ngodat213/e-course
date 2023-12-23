import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/cubit/home_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/widget/home_screen_content.dart';
import 'package:quiz_flutter/screen/home_screen/widget/menu_drawer.dart';
import 'package:quiz_flutter/screen/quiz_screen/cubit/quiz_cubit.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController carouselController = CarouselController();
  late HomeCubit _homeCubit;
  late SettingCubit _settingCubit;

  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    _settingCubit = context.read<SettingCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: const MenuDrawer(),
      appBar: _homeAppBar(),
      body: HomeScreenContent(
        carouselController: carouselController,
        homeCubit: _homeCubit,
        settingCubit: _settingCubit,
        onPressedCourse: _onPressedCourse,
        onPressedExam: _onPressedExam,
        onPressedCourseList: _onPressedCourseList,
      ),
    );
  }

  void _onPressedExam(Quiz quiz) {
    context.read<QuizCubit>().quizChanged(quiz);
    BaseNavigation.push(context, routeName: ManagerRoutes.quizScreen);
  }

  void _onPressedCourse(Course course) {
    context.read<CourseDetailCubit>().courseChanged(course);
    BaseNavigation.push(context, routeName: ManagerRoutes.courseDetailScreen);
  }

  void _onPressedAvatarUser() {
    BaseNavigation.push(context, routeName: ManagerRoutes.profileScreen);
  }

  void _onPressedCourseList() {
    BaseNavigation.push(context, routeName: ManagerRoutes.courseListScreen);
  }

  AppBar _homeAppBar() {
    return AppBar(
      elevation: 0,
      titleSpacing: Dimens.PADDING_SCREEN,
      title: _homeHeader(),
      iconTheme: const IconThemeData(color: AppColors.label),
      backgroundColor: AppColors.white,
    );
  }

  Widget _homeHeader() {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                _onPressedAvatarUser.call();
              },
              child: Container(
                width: Dimens.HEIGHT_32,
                height: Dimens.HEIGHT_32,
                margin: const EdgeInsets.only(left: Dimens.PADDING_16),
                child: CircleAvatar(
                  radius: Dimens.RADIUS_CIRCLE,
                  backgroundImage: NetworkImage(state.user.photoUrl!),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
