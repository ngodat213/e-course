import 'package:flutter/material.dart';

class TimeRemaining extends StatelessWidget {
  const TimeRemaining({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
