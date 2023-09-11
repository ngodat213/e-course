import 'package:flutter/material.dart';
import 'package:quiz_flutter/screen/sign_in_screen/widget/build_checkbox.dart';
import 'package:quiz_flutter/screen/sign_in_screen/widget/build_forgot_password.dart';
import 'package:quiz_flutter/themes/dimens.dart';

class BuildRememberMe extends StatelessWidget {
  const BuildRememberMe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: Dimens.PADDING_20),
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
