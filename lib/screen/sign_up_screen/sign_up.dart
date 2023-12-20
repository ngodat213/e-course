import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/screen/sign_up_screen/cubit/sign_up_cubit.dart';
import 'package:quiz_flutter/screen/sign_up_screen/widget/sign_up_screen_content.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(
        context.read<AuthRepository>(),
      ),
      child: SignUpForm(
        onPressedSignIn: _onPressedSignIn,
        onPressedCreateAccount: _onPressedCreateAccount,
        usernameController: _usernameController,
        phoneNumberController: _phoneNumberController,
        emailController: _emailController,
        passwordController: _passwordController,
        confirmPassController: _confirmPasswordController,
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
}
