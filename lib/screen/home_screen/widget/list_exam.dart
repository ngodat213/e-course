import 'package:flutter/material.dart';
import 'package:quiz_flutter/screen/home_screen/widget/card_exam.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class ListExam extends StatelessWidget {
  const ListExam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Today test', style: TxtStyle.title),
        const SizedBox(height: 8),
        Text('Here is your test list for today', style: TxtStyle.hintStyle),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Row(
            children: [
              CardExam(),
              CardExam(),
            ],
          ),
        )
      ],
    );
  }
}
