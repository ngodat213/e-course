import 'package:flutter/material.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class CardSlider extends StatelessWidget {
  const CardSlider(
    this.course, {
    super.key,
  });
  final Course course;

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
          Container(
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(Dimens.RADIUS_16),
              image: DecorationImage(
                image: NetworkImage(course.thumb),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Dimens.HEIGHT_200,
                  child: Text(course.title, style: TxtStyle.titleWhite),
                ),
                Text('${course.listLesson.length} ${S.of(context).lesson}',
                    style: TxtStyle.p),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 10,
                      backgroundImage: NetworkImage(DEFAULT_AVATAR),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Hydra',
                      style: TxtStyle.p,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
