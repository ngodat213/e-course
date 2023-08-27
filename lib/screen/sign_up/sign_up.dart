import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/screen/sign_up/cubit/sign_up_cubit.dart';
import 'package:quiz_flutter/screen/sign_up/widget/sign_up_btn.dart';
import 'package:quiz_flutter/screen/sign_up/widget/terms.dart';
import 'package:quiz_flutter/screen/sign_up/widget/thirty_part_login.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/build_header.dart';
import 'package:quiz_flutter/widgets/build_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(
        context.read<AuthRepository>(),
      ),
      child: const SignUpForm(),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
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
                        const SizedBox(height: 20),
                        const Terms(),
                        const SizedBox(height: 20),
                        const SignUpButton(),
                        const ThirtyPartLogin(),
                        const SizedBox(height: 48)
                      ],
                    ),
                  )
                ],
              ),
              const BuildBackButton()
            ],
          ),
        ),
      ),
    );
  }

  Column _textField(BuildContext context) {
    return Column(
      children: [
        BuildTextField(
          label: S.of(context).name,
          hintText: 'James Kris',
          func: (value) {
            context.read<SignUpCubit>().displayNameChanged(value);
          },
        ),
        const SizedBox(height: 20),
        BuildTextField(
          label: S.of(context).phoneNumber,
          hintText: S.of(context).enterPhoneNumber,
          isNumber: true,
          func: (value) {
            context.read<SignUpCubit>().phoneNumberChanged(value);
          },
        ),
        const SizedBox(height: 20),
        BuildTextField(
          label: S.of(context).email,
          hintText: S.of(context).emailExample,
          func: (value) {
            context.read<SignUpCubit>().emailChanged(value);
          },
        ),
        const SizedBox(height: 20),
        BuildTextField(
          label: S.of(context).password,
          hintText: S.of(context).passwordExample,
          isPassword: true,
          func: (value) {
            context.read<SignUpCubit>().passwordChanged(value);
          },
        ),
        const SizedBox(height: 20),
        BuildTextField(
          label: S.of(context).confirmPassword,
          hintText: S.of(context).passwordExample,
          isPassword: true,
          func: (value) {
            context.read<SignUpCubit>().confirmPasswordChanged(value);
          },
        ),
      ],
    );
  }
}
