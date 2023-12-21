import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/manager/manager_key_storage.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
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
  late AuthRepository _authRepository;
  bool keepLogin = false;
  @override
  void initState() {
    super.initState();
    _authRepository = context.read<AuthRepository>();
    onWidgetBuildDone(_splashScreenDelay);
  }

  void onWidgetBuildDone(Function function) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      function();
    });
  }

  Future<void> _splashScreenDelay() async {
    await _authRepository.handleGetUser();
    await _checkUserKeepLogin();
    await Future.delayed(const Duration(seconds: DELAY_SPLASH_SCREEN))
        .whenComplete(() {
      if (_authRepository.currentUser?.email != null || keepLogin) {
        BaseNavigation.push(context,
            routeName: ManagerRoutes.mainScreen, clearStack: true);
      } else {
        BaseNavigation.push(context,
            routeName: ManagerRoutes.signInScreen, clearStack: true);
      }
    });
  }

  Future<void> _checkUserKeepLogin() async {
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
                S.of(context).progressTitle,
                style: TxtStyle.buttonBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}
