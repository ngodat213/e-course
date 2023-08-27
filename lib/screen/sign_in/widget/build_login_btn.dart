import 'package:flutter/material.dart';
import 'package:quiz_flutter/controller/auth_controller.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/widgets/build_button.dart';

class BuildButtonLogin extends StatelessWidget {
  const BuildButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      text: S.of(context).login,
      onTap: () {
        AuthController(context: context).handleSignIn();
      },
    );
  }
}
