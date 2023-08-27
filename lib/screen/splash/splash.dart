import 'package:flutter/material.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static Page page() => const MaterialPage<void>(child: SplashScreen());

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).whenComplete(() =>
        BaseNavigation.push(context, routeName: ManagerRoutes.signInScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
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
