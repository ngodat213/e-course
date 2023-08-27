// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/sign_in/bloc/sign_in_bloc.dart';
import 'package:quiz_flutter/screen/sign_in/widget/build_login_btn.dart';
import 'package:quiz_flutter/screen/sign_in/widget/remenber_me.dart';
import 'package:quiz_flutter/screen/sign_in/widget/thirty_part_login.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/build_header.dart';
import 'package:quiz_flutter/widgets/build_textfield.dart';
import 'widget/build_sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
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
                          const BuildButtonLogin(),
                          const ThirtyPartLogin(),
                          const BuildSignUp()
                        ],
                      ),
                    ),
                  ],
                ),
                const BuildBackButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  Column _textField(BuildContext context) {
    return Column(
      children: [
        BuildTextField(
          label: S.of(context).email,
          hintText: S.of(context).emailExample,
          func: (value) {
            context.read<SignInBloc>().add(EmailEvent(value));
          },
        ),
        const SizedBox(height: 20),
        BuildTextField(
          label: S.of(context).password,
          hintText: S.of(context).passwordExample,
          isPassword: true,
          func: (value) {
            context.read<SignInBloc>().add(PasswordEvent(value));
          },
        ),
      ],
    );
  }
}
