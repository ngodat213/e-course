import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class Terms extends StatelessWidget {
  const Terms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: Text(
        'By tapping sign up you agree to the Terms and Condition and Privacy Policy of this app',
        textAlign: TextAlign.center,
        style: TxtStyle.labelStyle,
      ),
    );
  }
}
