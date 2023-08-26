import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/controller/auth_controller.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/build_button.dart';
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
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return Scaffold(
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
                      BuildTextField(
                        label: S.of(context).email,
                        hintText: S.of(context).emailExample,
                        func: (value) {
                          context
                              .read<ForgotPasswordBloc>()
                              .add(EmailEvent(value));
                        },
                      ),
                      const SizedBox(height: 20),
                      BuildButton(
                        text: S.of(context).send,
                        onTap: () {
                          AuthController(context: context)
                              .handleResetPassword();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
            const BuildBackButton()
          ]),
        );
      },
    );
  }
}
