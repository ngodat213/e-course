import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class ProfileTitle extends StatelessWidget {
  const ProfileTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Profile Details",
            style: TxtStyle.buttonBlack,
          )),
    );
  }
}
