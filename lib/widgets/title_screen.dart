import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(title, style: TxtStyle.buttonBlack),
      ),
    );
  }
}
