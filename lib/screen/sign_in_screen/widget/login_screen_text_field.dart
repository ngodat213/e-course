import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/sign_in_screen/cubit/sign_in_cubit.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/widgets/build_textfield.dart';

class LoginScreenTextField extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginScreenTextField({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildTextField(
          controller: emailController,
          label: S.of(context).email,
          hintText: S.of(context).emailExample,
        ),
        const SizedBox(height: Dimens.HEIGHT_20),
        BuildTextField(
          controller: passwordController,
          label: S.of(context).password,
          hintText: S.of(context).passwordExample,
          isPassword: true,
        ),
      ],
    );
  }
}
