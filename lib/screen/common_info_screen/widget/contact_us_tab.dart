import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/screen/common_info_screen/cubit/commo_info_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/build_button.dart';
import 'package:quiz_flutter/widgets/build_textfield.dart';

class ContactUsTab extends StatefulWidget {
  const ContactUsTab({super.key});

  @override
  State<ContactUsTab> createState() => _ContactUsTabState();
}

class _ContactUsTabState extends State<ContactUsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      child: Column(
        children: [
          const SizedBox(height: Dimens.HEIGHT_30),
          BuildTextField(
            label: 'Full name',
            hintText: 'Name, Surname',
            func: (value) {
              context.read<CommoInfoCubit>().fullNameChanged(value);
            },
          ),
          const SizedBox(height: Dimens.HEIGHT_20),
          BuildTextField(
            label: 'Email',
            hintText: 'E-mail',
            func: (value) {
              context.read<CommoInfoCubit>().emailChanged(value);
            },
          ),
          const SizedBox(height: Dimens.HEIGHT_20),
          BuildTextField(
            label: 'Topic',
            hintText: 'Topic of Message',
            func: (value) {
              context.read<CommoInfoCubit>().topicChanged(value);
            },
          ),
          const SizedBox(height: Dimens.HEIGHT_20),
          _textField(
            func: (value) {
              context.read<CommoInfoCubit>().textChanged(value);
            },
          ),
          const SizedBox(height: Dimens.HEIGHT_20),
          BuildButton(
            text: 'Submit message',
            onTap: () {
              context.read<CommoInfoCubit>().updateContact();
            },
          ),
        ],
      ),
    );
  }
}

class _textField extends StatelessWidget {
  _textField({required this.func});
  void Function(String value)? func;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          TextFormField(
            onChanged: (value) => func!(value),
            minLines: 10,
            maxLines: 20,
            keyboardType: TextInputType.multiline,
            style: TxtStyle.inputStyle,
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Text',
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
