import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/repo/auth_repository.dart';
import 'package:quiz_flutter/screen/forgot_password_screen/cubit/forgot_password_cubit.dart';
import 'package:quiz_flutter/screen/forgot_password_screen/widget/forgot_password_btn.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/build_header.dart';
import 'package:quiz_flutter/widgets/build_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(context.read<AuthRepository>()),
      child: const ForgotPasswordForm(),
    );
  }
}

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status == ForgotPasswordStatus.error) {}
        if (state.status == ForgotPasswordStatus.success) {
          BaseNavigation.pop(context);
        }
      },
      child: Scaffold(
        body: Stack(children: [
          Column(
            children: [
              BuildHeader(
                text: S.of(context).forgotPassword,
                title: S.of(context).forgotPasswordTitle,
              ),
              const SizedBox(height: 25),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    _textField(context),
                    const SizedBox(height: 20),
                    const ForgotPasswordButton()
                  ],
                ),
              ),
            ],
          ),
          BuildBackButton()
        ]),
      ),
    );
  }

  BuildTextField _textField(BuildContext context) {
    return BuildTextField(
      label: S.of(context).email,
      hintText: S.of(context).emailExample,
      func: (value) {
        context.read<ForgotPasswordCubit>().emailChanged(value);
      },
    );
  }
}
