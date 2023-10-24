import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/manager/manager_key_storage.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/course_list_screen/cubit/course_list_screen_cubit.dart';
import 'package:quiz_flutter/screen/course_screen/cubit/course_screen_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/cubit/home_cubit.dart';
import 'package:quiz_flutter/screen/main_screen.dart/cubit/main_cubit.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/utils/base_shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static Page page() => const MaterialPage<void>(child: SplashScreen());

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool keepLogin = false;
  @override
  void initState() {
    checkUserKeepLogin().whenComplete(
        () async => Timer(const Duration(seconds: DELAY_SPLASH_SCREEN), () {
              if (keepLogin) {
                BaseNavigation.push(context,
                    routeName: ManagerRoutes.mainScreen, clearStack: true);
                context.read<HomeCubit>().getCourse();
                context.read<HomeCubit>().getQuiz();
                context.read<SettingCubit>().getUser();
                context.read<MainCubit>().indexChanged(0);
                context.read<CourseListScreenCubit>().getCourse();
                context.read<CourseScreenCubit>().getCourse();
              } else {
                BaseNavigation.push(context,
                    routeName: ManagerRoutes.signInScreen, clearStack: true);
              }
            }));
    super.initState();
  }

  Future<void> checkUserKeepLogin() async {
    print(
        "${await BaseSharedPreferences.containKey(ManagerKeyStorage.keepLogin)}- ${await BaseSharedPreferences.getStringValue(ManagerKeyStorage.accessToken)}");
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.keepLogin) ==
        true) {
      setState(() {
        keepLogin = true;
      });
    } else if (await BaseSharedPreferences.getStringValue(
            ManagerKeyStorage.accessToken) !=
        '') {
      setState(() {
        keepLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Images.iconLogo,
                color: AppColors.main,
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome to E-Course',
                style: TxtStyle.buttonBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}
