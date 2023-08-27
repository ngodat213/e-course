import 'package:flutter/widgets.dart';
import 'package:quiz_flutter/screen/app/bloc/app_bloc.dart';
import 'package:quiz_flutter/screen/home/home.dart';
import 'package:quiz_flutter/screen/splash/splash.dart';

List<Page> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
      return [SplashScreen.page()];
  }
}
