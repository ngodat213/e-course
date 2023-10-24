import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class BuildTextField extends StatelessWidget {
  BuildTextField({
    super.key,
    this.isPassword,
    this.isNumber,
    this.func,
    this.label,
    this.controller,
    required this.hintText,
  });
  String? label;
  final String hintText;
  bool? isPassword = false;
  bool? isNumber = false;
  void Function(String value)? func;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: label == null ? 47 : 67,
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
          label != null
              ? Text(
                  label!,
                  style: TxtStyle.labelStyle,
                )
              : Container(),
          TextFormField(
            controller: controller,
            onChanged: (value) => func!(value),
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
