import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class BuildBackButton extends StatelessWidget {
  const BuildBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 25,
      child: GestureDetector(
        onTap: () {
          BaseNavigation.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(Images.iconArrowLeft),
        ),
      ),
    );
  }
}
