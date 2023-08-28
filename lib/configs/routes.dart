import 'package:flutter/widgets.dart';
import 'package:quiz_flutter/screen/app/bloc/app_bloc.dart';
import 'package:quiz_flutter/screen/home_screen/home_screen.dart';
import 'package:quiz_flutter/screen/sign_in_screen/sign_in.dart';

List<Page> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
      return [SignInScreen.page()];
  }
}
