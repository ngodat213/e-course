import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class BuildTextField extends StatelessWidget {
  BuildTextField({
    super.key,
    this.isPassword,
    this.isNumber,
    required this.label,
    required this.hintText,
  });
  final String label;
  final String hintText;
  bool? isPassword = false;
  bool? isNumber = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppColors.shadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            label,
            style: TxtStyle.labelStyle,
          ),
          TextFormField(
            keyboardType: isNumber == true ? TextInputType.number : null,
            obscureText: isPassword ?? false,
            style: TxtStyle.inputStyle,
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(vertical: 6),
              labelStyle: TxtStyle.labelStyle,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
