import 'package:flutter/material.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class CurrentQuestion extends StatelessWidget {
  const CurrentQuestion({
    super.key,
    required this.current,
    required this.maxCurrent,
  });

  final int current;
  final int maxCurrent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: const BoxDecoration(color: AppColors.main),
      child: Center(
        child: Text('${S.of(context).question} $current/$maxCurrent',
            style: TxtStyle.p),
      ),
    );
  }
}
