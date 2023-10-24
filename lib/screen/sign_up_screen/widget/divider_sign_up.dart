import 'package:flutter/material.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class DividerSignUp extends StatelessWidget {
  const DividerSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Dimens.PADDING_20),
      child: Row(
        children: [
          const Expanded(
              child: Divider(
            color: Colors.black,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.PADDING_18),
            child: Text(
              S.of(context).loginWith,
              style: TxtStyle.text,
            ),
          ),
          const Expanded(
              child: Divider(
            color: Colors.black,
          )),
        ],
      ),
    );
  }
}
