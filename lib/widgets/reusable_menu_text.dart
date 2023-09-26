import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class ReusableMenuText extends StatelessWidget {
  const ReusableMenuText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          right: Dimens.PADDING_12,
          top: Dimens.PADDING_18,
          bottom: Dimens.PADDING_18),
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.PADDING_20, vertical: Dimens.PADDING_6),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
      ),
      child: Text(text, style: TxtStyle.p),
    );
  }
}
