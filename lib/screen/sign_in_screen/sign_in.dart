import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/screen/sign_in_screen/cubit/sign_in_cubit.dart';
import 'package:quiz_flutter/screen/sign_in_screen/widget/login_screen_content.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static Page page() => const MaterialPage<void>(child: SignInScreen());
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isCheck = false;
  bool isWrong = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(
        context.read<AuthRepository>(),
      ),
      child: LoginContent(
        isWrongAccount: isWrong,
        emailController: _emailController,
        passwordController: _passwordController,
        onPressedSignIn: _onPressedSignIn,
        onPressedCreateAccount: _onPressedCreateAccount,
        onPressedForgetPassword: _onPressedForgetPassword,
      ),
    );
  }

  void _onPressedSignIn() {
    BaseNavigation.push(context,
        routeName: ManagerRoutes.mainScreen, clearStack: true);
  }

  void _onPressedCreateAccount() {
    BaseNavigation.push(context, routeName: ManagerRoutes.signUpScreen);
  }

  void _onPressedForgetPassword() {
    BaseNavigation.push(context, routeName: ManagerRoutes.forgotPasswordScreen);
  }
}
