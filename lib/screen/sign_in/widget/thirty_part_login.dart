import 'package:flutter/material.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/login_with_social.dart';

class ThirtyPartLogin extends StatelessWidget {
  const ThirtyPartLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              const Expanded(
                  child: Divider(
                color: Colors.black,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  S.of(context).loginWith,
                  style: TxtStyle.text,
                ),
              ),
              const Expanded(
                  child: Divider(
                color: Colors.black,
              )),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BuildLoginWithSocial(
              iconPath: Images.iconGoogle,
              text: S.of(context).google,
              onTap: () {},
            ),
            BuildLoginWithSocial(
              iconPath: Images.iconFacebook,
              text: S.of(context).facebook,
              bgColor: AppColors.colorFb,
              textStyle: TxtStyle.buttonWhite,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
