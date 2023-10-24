import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class ExamDone extends StatelessWidget {
  const ExamDone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.HEIGHT_65,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: Dimens.PADDING_8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
          boxShadow: AppColors.shadow,
          color: AppColors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.PADDING_16, vertical: Dimens.PADDING_10),
        child: Row(
          children: [
            Container(
              width: Dimens.HEIGHT_45,
              height: Dimens.HEIGHT_45,
              margin: const EdgeInsets.only(right: Dimens.PADDING_6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
                color: AppColors.main,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Math Final Exam', style: TxtStyle.text),
                Expanded(child: Container()),
                Text('45 ${S.of(context).minutes}', style: TxtStyle.labelStyle),
              ],
            ),
            Expanded(child: Container()),
            Container(
              width: Dimens.HEIGHT_45,
              height: Dimens.HEIGHT_45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
                color: AppColors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(Dimens.RADIUS_16),
                child: Center(
                  child:
                      SvgPicture.asset(Images.iconCheck, color: AppColors.main),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
