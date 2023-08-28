import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class CardExam extends StatelessWidget {
  const CardExam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.colorFb,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: Container(
              width: 130,
              height: 110,
              decoration: const BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimens.RADIUS_8),
                  bottomLeft: Radius.circular(Dimens.RADIUS_8),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Math Final Exam', style: TxtStyle.labelWhite),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Images.iconClock,
                          color: AppColors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '45 Minutes',
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
