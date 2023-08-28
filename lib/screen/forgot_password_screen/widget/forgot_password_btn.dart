import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/forgot_password_screen/cubit/forgot_password_cubit.dart';
import 'package:quiz_flutter/widgets/build_button.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      text: S.of(context).send,
      onTap: () {
        context.read<ForgotPasswordCubit>().forgotPassword();
      },
    );
  }
}
