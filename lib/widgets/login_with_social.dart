import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class BuildLoginWithSocial extends StatelessWidget {
  BuildLoginWithSocial({
    Key? key,
    required this.iconPath,
    required this.text,
    required this.onTap,
    this.bgColor,
    this.textStyle,
  }) : super(key: key);

  final String iconPath;
  final String text;
  final VoidCallback onTap;
  Color? bgColor;
  TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppColors.shadow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: SvgPicture.asset(iconPath),
              ),
              Text(
                text,
                style: textStyle ?? TxtStyle.buttonBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}
