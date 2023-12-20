import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/sign_up_screen/cubit/sign_up_cubit.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/build_button.dart';
import 'package:quiz_flutter/widgets/build_header.dart';
import 'package:quiz_flutter/widgets/build_textfield.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPassController;
  final Function() onPressedSignIn;
  final Function() onPressedCreateAccount;
  const SignUpForm({
    super.key,
    required this.usernameController,
    required this.phoneNumberController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPassController,
    required this.onPressedSignIn,
    required this.onPressedCreateAccount,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status == SignUpStatus.error) {}
        if (state.status == SignUpStatus.success) {
          BaseNavigation.pop(context);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  BuildHeader(
                    text: S.of(context).signUp,
                    title: S.of(context).createYourAccount,
                  ),
                  const SizedBox(height: 25),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        _textField(context),
                        const SizedBox(height: Dimens.HEIGHT_20),
                        _termsText(context),
                        const SizedBox(height: Dimens.HEIGHT_20),
                        _signUpButton(),
                        const SizedBox(height: Dimens.HEIGHT_48)
                      ],
                    ),
                  )
                ],
              ),
              BuildBackButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == SignUpStatus.submitting
            ? const CircularProgressIndicator()
            : BuildButton(
                text: S.of(context).signUp,
                onTap: () {
                  if (passwordController.text == confirmPassController.text) {
                    context.read<SignUpCubit>().signupFormSubmitted(
                          usernameController.text,
                          phoneNumberController.text,
                          emailController.text,
                          passwordController.text,
                        );
                  } else {
                    toastInfo(
                        msg: 'Password and confirm password is not equal');
                  }
                },
              );
      },
    );
  }

  Widget _termsText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.PADDING_33),
      child: Text(
        S.of(context).terms,
        textAlign: TextAlign.center,
        style: TxtStyle.labelStyle,
      ),
    );
  }

  Widget _textField(BuildContext context) {
    return Column(
      children: [
        BuildTextField(
          label: S.of(context).name,
          hintText: 'James Kris',
          controller: usernameController,
        ),
        const SizedBox(height: Dimens.HEIGHT_20),
        BuildTextField(
          label: S.of(context).phoneNumber,
          hintText: S.of(context).enterPhoneNumber,
          isNumber: true,
          controller: phoneNumberController,
        ),
        const SizedBox(height: Dimens.HEIGHT_20),
        BuildTextField(
          label: S.of(context).email,
          hintText: S.of(context).emailExample,
          controller: emailController,
        ),
        const SizedBox(height: Dimens.HEIGHT_20),
        BuildTextField(
          label: S.of(context).password,
          hintText: S.of(context).passwordExample,
          isPassword: true,
          controller: passwordController,
        ),
        const SizedBox(height: Dimens.HEIGHT_20),
        BuildTextField(
          label: S.of(context).confirmPassword,
          hintText: S.of(context).passwordExample,
          isPassword: true,
          controller: confirmPassController,
        ),
      ],
    );
  }
}
