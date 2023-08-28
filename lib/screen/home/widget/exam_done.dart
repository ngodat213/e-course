import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';

class ExamDone extends StatelessWidget {
  const ExamDone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
        boxShadow: AppColors.shadow,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.main,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Math final Exam'),
                Expanded(child: Container()),
                const Text('45 Minutes'),
              ],
            ),
            Expanded(child: Container()),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
                color: AppColors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
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
