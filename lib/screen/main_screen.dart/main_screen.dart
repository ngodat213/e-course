import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/screen/home_screen/home_screen.dart';
import 'package:quiz_flutter/screen/main_screen.dart/cubit/main_cubit.dart';
import 'package:quiz_flutter/screen/main_screen.dart/widget/bottom_nav.dart';
import 'package:quiz_flutter/screen/course_screen/course_screen.dart';
import 'package:quiz_flutter/screen/setting_screen/setting_screen.dart';
import 'package:quiz_flutter/themes/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [
    const HomeScreen(),
    const CourseScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          bottomNavigationBar: const BuildBottomNavBar(),
          body: pages[state.pageIndex],
        );
      },
    );
  }
}
