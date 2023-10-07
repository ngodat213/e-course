import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class ChangedProfile extends StatelessWidget {
  const ChangedProfile({
    super.key,
    required this.title,
    required this.text,
  });
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TxtStyle.buttonBlack),
          const Spacer(),
          Text(text, style: TxtStyle.text),
        ],
      ),
    );
  }
}
