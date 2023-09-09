import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class TabReview extends StatefulWidget {
  const TabReview({super.key});

  @override
  State<TabReview> createState() => _TabReviewState();
}

class _TabReviewState extends State<TabReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 28),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeedBack(),
            FeedBack(),
            FeedBack(),
          ],
        ),
      ),
    );
  }
}

class FeedBack extends StatelessWidget {
  const FeedBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(child: Image.network(DEFAULT_AVATAR)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hydra Coder',
                  style: TxtStyle.text.copyWith(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    SvgPicture.asset(Images.iconStar, width: 12),
                    SvgPicture.asset(Images.iconStar, width: 12),
                    SvgPicture.asset(Images.iconStar, width: 12),
                    SvgPicture.asset(Images.iconStar, width: 12),
                    SvgPicture.asset(Images.iconStar, width: 12),
                    const SizedBox(width: 8),
                    Text('• 12 Feb 2022', style: TxtStyle.time),
                  ],
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'The explanation is very easy to understand, really cool, understandable and.',
          style: TxtStyle.labelStyle,
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}
