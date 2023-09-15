import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/sign_in_screen/cubit/sign_in_cubit.dart';
import 'package:quiz_flutter/widgets/build_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submitting
            ? BuildButton(
                text: S.of(context).login,
                isLoading: true,
              )
            : BuildButton(
                text: S.of(context).login,
                onTap: () {
                  context.read<SignInCubit>().logInWithCredentials();
                },
              );
      },
    );
  }
}
