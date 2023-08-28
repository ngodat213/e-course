import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/sign_up_screen/cubit/sign_up_cubit.dart';
import 'package:quiz_flutter/widgets/build_button.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == SignUpStatus.submitting
            ? const CircularProgressIndicator()
            : BuildButton(
                text: S.of(context).signUp,
                onTap: () {
                  context.read<SignUpCubit>().signupFormSubmitted();
                },
              );
      },
    );
  }
}
