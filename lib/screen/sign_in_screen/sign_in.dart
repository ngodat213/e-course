// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/screen/sign_in_screen/cubit/sign_in_cubit.dart';
import 'package:quiz_flutter/screen/sign_in_screen/widget/login_btn.dart';
import 'package:quiz_flutter/screen/sign_in_screen/widget/remenber_me.dart';
import 'package:quiz_flutter/screen/sign_in_screen/widget/sign_up.dart';
import 'package:quiz_flutter/screen/sign_up_screen/widget/thirty_part_login.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/build_header.dart';
import 'package:quiz_flutter/widgets/build_textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static Page page() => const MaterialPage<void>(child: SignInScreen());
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(
        context.read<AuthRepository>(),
      ),
      child: const LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {}
        if (state.status == LoginStatus.success) {
          BaseNavigation.push(
            context,
            routeName: ManagerRoutes.homeScreen,
            clearStack: true,
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BuildHeader(
                text: S.of(context).login,
                title: S.of(context).hi,
              ),
              const SizedBox(height: 25),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    _textField(context),
                    const BuildRememberMe(),
                    const SizedBox(height: 20),
                    const LoginButton(),
                    const ThirtyPartLogin(),
                    const BuildSignUp()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder _textField(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: ((previous, current) =>
          previous.email != current.email &&
          previous.password != current.password),
      builder: (context, state) {
        return Column(
          children: [
            BuildTextField(
              label: S.of(context).email,
              hintText: S.of(context).emailExample,
              func: (value) {
                context.read<SignInCubit>().emailChanged(value);
              },
            ),
            const SizedBox(height: 20),
            BuildTextField(
              label: S.of(context).password,
              hintText: S.of(context).passwordExample,
              isPassword: true,
              func: (value) {
                context.read<SignInCubit>().passwordChanged(value);
              },
            ),
          ],
        );
      },
    );
  }
}
