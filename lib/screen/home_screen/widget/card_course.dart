import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: Dimens.HEIGHT_150,
      margin: const EdgeInsets.only(
          top: Dimens.PADDING_18,
          left: Dimens.PADDING_SCREEN,
          right: Dimens.PADDING_SCREEN),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: SvgPicture.asset(
              Images.imageCourse0,
              height: Dimens.HEIGHT_150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.PADDING_16,
              vertical: Dimens.PADDING_16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hydra', style: TxtStyle.p),
                const SizedBox(height: Dimens.HEIGHT_25),
                SizedBox(
                  width: Dimens.HEIGHT_200,
                  child:
                      Text('Flutter for begginer', style: TxtStyle.titleWhite),
                ),
                Text('20/25 ${S.of(context).lesson}', style: TxtStyle.p),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
