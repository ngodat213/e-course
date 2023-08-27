import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/screen/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:quiz_flutter/screen/sign_in/cubit/sign_in_cubit.dart';
import 'package:quiz_flutter/screen/sign_up/cubit/sign_up_cubit.dart';

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
  ];
}
