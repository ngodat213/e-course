import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/manager/manager_key_storage.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/images.dart';
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
              keepLogin
                  ? BaseNavigation.push(context,
                      routeName: ManagerRoutes.mainScreen)
                  : BaseNavigation.push(context,
                      routeName: ManagerRoutes.signInScreen);
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.imageSplash),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
