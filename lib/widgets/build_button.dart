import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class BuildButton extends StatelessWidget {
  BuildButton(
      {super.key,
      required this.text,
      this.bgColor,
      this.textStyle,
      this.onTap});
  final String text;
  Color? bgColor;
  TextStyle? textStyle;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.lavender,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(text, style: TxtStyle.buttonWhite),
        ),
      ),
    );
  }
}
