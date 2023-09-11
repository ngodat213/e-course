import 'package:flutter/material.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class Terms extends StatelessWidget {
  const Terms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.PADDING_33),
      child: Text(
        S.of(context).terms,
        textAlign: TextAlign.center,
        style: TxtStyle.labelStyle,
      ),
    );
  }
}
