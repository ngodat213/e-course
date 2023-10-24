import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/themes/images.dart';

class TimeRemaining extends StatefulWidget {
  const TimeRemaining({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<TimeRemaining> createState() => _TimeRemainingState();
}

class _TimeRemainingState extends State<TimeRemaining> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Images.iconTime),
        const SizedBox(width: 5),
        Text(widget.title),
      ],
    );
  }
}
