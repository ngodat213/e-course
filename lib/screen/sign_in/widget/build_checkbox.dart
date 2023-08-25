import 'package:flutter/material.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/themes/colors.dart';
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
            width: 24,
            height: 25,
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: AppColors.shadow,
            ),
            child: isCheck
                ? const Icon(
                    Icons.check,
                    color: AppColors.lavender,
                    size: 14,
                  )
                : null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            S.of(context).rememberMe,
            style: TxtStyle.text,
          ),
        ),
      ],
    );
  }
}
