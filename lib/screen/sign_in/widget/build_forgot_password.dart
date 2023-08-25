import 'package:flutter/material.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class BuildForgotPassword extends StatelessWidget {
  const BuildForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BaseNavigation.push(context,
            routeName: ManagerRoutes.forgotPasswordScreen);
      },
      child: Text(
        S.of(context).forgotPasswordAnswer,
        style: TxtStyle.text,
      ),
    );
  }
}
