import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/screen/forgot_password_screen/cubit/forgot_password_cubit.dart';
import 'package:quiz_flutter/screen/main_screen.dart/cubit/main_cubit.dart';
import 'package:quiz_flutter/screen/sign_in_screen/cubit/sign_in_cubit.dart';
import 'package:quiz_flutter/screen/sign_up_screen/cubit/sign_up_cubit.dart';

class ManagerProvider {
  ManagerProvider._();

  static List<SingleChildWidget> provider = [
    BlocProvider(
        create: (context) => SignInCubit(context.read<AuthRepository>())),
    BlocProvider(
        create: (context) => SignUpCubit(context.read<AuthRepository>())),
    BlocProvider(
        create: (context) =>
            ForgotPasswordCubit(context.read<AuthRepository>())),
    BlocProvider(create: (context) => MainCubit()),
  ];
}
