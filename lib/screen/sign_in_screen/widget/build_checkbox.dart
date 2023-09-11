import 'package:flutter/material.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class BuildCheckBox extends StatefulWidget {
  const BuildCheckBox({super.key});

  @override
  State<BuildCheckBox> createState() => _BuildCheckBoxState();
}

class _BuildCheckBoxState extends State<BuildCheckBox> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isCheck = !isCheck;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: Dimens.HEIGHT_24,
            height: Dimens.HEIGHT_25,
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
              boxShadow: AppColors.shadow,
            ),
            child: isCheck
                ? const Icon(
                    Icons.check,
                    color: AppColors.main,
                    size: Dimens.SIZE_14,
                  )
                : null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: Dimens.PADDING_10),
          child: Text(
            S.of(context).rememberMe,
            style: TxtStyle.text,
          ),
        ),
      ],
    );
  }
}
