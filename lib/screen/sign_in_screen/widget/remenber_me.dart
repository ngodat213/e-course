import 'package:flutter/material.dart';
import 'package:quiz_flutter/screen/sign_in_screen/widget/build_checkbox.dart';
import 'package:quiz_flutter/screen/sign_in_screen/widget/build_forgot_password.dart';

class BuildRememberMe extends StatelessWidget {
  const BuildRememberMe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildCheckBox(),
          BuildForgotPassword(),
        ],
      ),
    );
  }
}
