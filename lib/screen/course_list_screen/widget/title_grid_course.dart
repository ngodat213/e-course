import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class TitleGridCourse extends StatelessWidget {
  const TitleGridCourse({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: Dimens.PADDING_SCREEN,
        ),
        child: Text(title, style: TxtStyle.title));
  }
}
