import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class CardExam extends StatelessWidget {
  const CardExam({
    super.key,
    required this.quiz,
    required this.image,
  });
  final Quiz quiz;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: Dimens.PADDING_16),
      child: Stack(
        children: [
          Container(
            width: Dimens.HEIGHT_160,
            height: Dimens.HEIGHT_200,
            decoration: BoxDecoration(
              color: AppColors.colorFb,
              borderRadius: BorderRadius.circular(Dimens.RADIUS_10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.RADIUS_10),
              child: SvgPicture.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: Dimens.PADDING_ZERO,
            bottom: Dimens.PADDING_10,
            child: Container(
              width: Dimens.HEIGHT_130,
              height: Dimens.HEIGHT_100,
              decoration: const BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimens.RADIUS_8),
                  bottomLeft: Radius.circular(Dimens.RADIUS_8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimens.PADDING_16, horizontal: Dimens.PADDING_8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(quiz.title, style: TxtStyle.labelWhite),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Images.iconClock,
                          color: AppColors.white,
                        ),
                        const SizedBox(width: Dimens.HEIGHT_8),
                        Text(
                          '${quiz.lessons.length} ${S.of(context).lesson}',
                          style: TxtStyle.p,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
