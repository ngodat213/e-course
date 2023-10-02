import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/repo/user_repository/user_repository.dart';
import 'package:quiz_flutter/screen/app/bloc/app_bloc.dart';
import 'package:quiz_flutter/screen/common_info_screen/cubit/commo_info_cubit.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/course_list_screen/cubit/course_list_cubit.dart';
import 'package:quiz_flutter/screen/course_screen/cubit/course_screen_cubit.dart';
import 'package:quiz_flutter/screen/course_video/cubit/course_video_cubit.dart';
import 'package:quiz_flutter/screen/forgot_password_screen/cubit/forgot_password_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/cubit/home_cubit.dart';
import 'package:quiz_flutter/screen/main_screen.dart/cubit/main_cubit.dart';
import 'package:quiz_flutter/screen/profile_screen/cubit/profile_cubit.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/cubit/quiz_play_cubit.dart';
import 'package:quiz_flutter/screen/quiz_screen/cubit/quiz_cubit.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/screen/sign_in_screen/cubit/sign_in_cubit.dart';
import 'package:quiz_flutter/screen/sign_up_screen/cubit/sign_up_cubit.dart';

class ManagerProvider {
  ManagerProvider._();

  static List<SingleChildWidget> provider = [
    BlocProvider(
      create: (context) => SignInCubit(context.read<AuthRepository>()),
    ),
    BlocProvider(create: (context) => HomeCubit(context.read<AppRepository>())),
    BlocProvider(
      create: (context) => SignUpCubit(context.read<AuthRepository>()),
    ),
    BlocProvider(
      create: (context) => ForgotPasswordCubit(context.read<AuthRepository>()),
    ),
    BlocProvider(create: (context) => MainCubit()),
    BlocProvider(create: (context) => AppBloc(context.read<AuthRepository>())),
    BlocProvider(
      create: (context) => QuizCubit(context.read<AppRepository>()),
    ),
    BlocProvider(
      create: (context) => QuizPlayCubit(context.read<AppRepository>()),
    ),
    BlocProvider(
      create: (context) => CourseDetailCubit(
        context.read<AppRepository>(),
        context.read<UserRepository>(),
      ),
    ),
    BlocProvider(
      create: (context) => CommoInfoCubit(context.read<AppRepository>()),
    ),
    BlocProvider(
      create: (context) => SettingCubit(
        context.read<AuthRepository>(),
        context.read<UserRepository>(),
      ),
    ),
    BlocProvider(
      create: (context) => ProfileCubit(
        context.read<UserRepository>(),
        context.read<AuthRepository>(),
      ),
    ),
    BlocProvider(
      create: (context) => CourseListCubit(context.read<AppRepository>()),
    ),
    BlocProvider(
      create: (context) => CourseScreenCubit(
        context.read<AppRepository>(),
        context.read<UserRepository>(),
      ),
    ),
    BlocProvider(
      create: (context) => CourseVideoCubit(context.read<AppRepository>()),
    ),
  ];
}
