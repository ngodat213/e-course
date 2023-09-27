import 'package:flutter/material.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/widgets/reusable_menu_text.dart';

class GridViewType extends StatelessWidget {
  const GridViewType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Dimens.PADDING_SCREEN,
      ),
      child: Row(
        children: [
          ReusableMenuText(S.of(context).all),
          ReusableMenuText(S.of(context).cpp),
          ReusableMenuText(S.of(context).python),
          ReusableMenuText(S.of(context).cs),
        ],
      ),
    );
  }
}
