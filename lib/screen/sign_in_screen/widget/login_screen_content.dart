import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/sign_in_screen/cubit/sign_in_cubit.dart';
import 'package:quiz_flutter/screen/sign_in_screen/widget/login_screen_text_field.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/build_button.dart';
import 'package:quiz_flutter/widgets/build_header.dart';

class LoginContent extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function() onPressedSignIn;
  final Function() onPressedCreateAccount;
  final Function() onPressedForgetPassword;
  final bool isWrongAccount;
  const LoginContent({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onPressedSignIn,
    required this.onPressedCreateAccount,
    required this.onPressedForgetPassword,
    required this.isWrongAccount,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {}
        if (state.status == LoginStatus.success) {
          BaseNavigation.push(
            context,
            routeName: ManagerRoutes.splashScreen,
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
                title: S.of(context).hiTitle,
              ),
              const SizedBox(height: Dimens.HEIGHT_25),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: Dimens.PADDING_SCREEN),
                child: Column(
                  children: [
                    LoginScreenTextField(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    const SizedBox(height: Dimens.HEIGHT_20),
                    _buildForgotPassword(context),
                    const SizedBox(height: Dimens.HEIGHT_20),
                    _buildButton(),
                    _buildSignUp(context)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return BuildButton(
          text: S.of(context).login,
          onTap: () {
            context.read<SignInCubit>().logInWithCredentials(
                emailController.text, passwordController.text);
          },
        );
      },
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.PADDING_20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).dontHaveAccount,
            style: TxtStyle.text,
          ),
          GestureDetector(
            onTap: () {
              onPressedCreateAccount.call();
            },
            child: Text(
              S.of(context).signUp,
              style: TxtStyle.textButton,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          onPressedForgetPassword.call();
        },
        child: Text(
          S.of(context).forgotPasswordAnswer,
          style: TxtStyle.text,
        ),
      ),
    );
  }
}
