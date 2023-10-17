import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/cubit/quiz_play_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class CommitButton extends StatefulWidget {
  const CommitButton({
    super.key,
  });

  @override
  State<CommitButton> createState() => _CommitButtonState();
}

class _CommitButtonState extends State<CommitButton> {
  void _showDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return const CommitDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 70,
      child: GestureDetector(
        onTap: _showDialog,
        child: Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 2, 9, 61),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.RADIUS_8),
              bottomLeft: Radius.circular(Dimens.RADIUS_8),
            ),
          ),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
            size: 15,
          ),
        ),
      ),
    );
  }
}

class CommitDialog extends StatefulWidget {
  const CommitDialog({super.key});

  @override
  State<CommitDialog> createState() => _CommitDialogState();
}

class _CommitDialogState extends State<CommitDialog> {
  void _cancel() {
    BaseNavigation.pop(context);
  }

  void _commit() {
    context.read<QuizPlayCubit>().commit();
    BaseNavigation.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text("Questions"),
          actions: [
            TextButton(
              onPressed: _cancel,
              child: Text("Cancel", style: TxtStyle.text),
            ),
            TextButton(
              onPressed: _commit,
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(AppColors.main),
              ),
              child: Text("Commit", style: TxtStyle.p),
            )
          ],
          content: SingleChildScrollView(
            child: SizedBox(
              width: 300,
              child: Wrap(
                children: [
                  for (int i = 0; i < state.userChooise.length; i++)
                    GestureDetector(
                      onTap: () {
                        context.read<QuizPlayCubit>().indexChanged(i);
                      },
                      child: _OptionSelect(i: i),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _OptionSelect extends StatelessWidget {
  const _OptionSelect({
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        return Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(left: 8, bottom: 6),
          decoration: BoxDecoration(
            color: state.userChooise[i] == -1 ? AppColors.grey : AppColors.main,
            borderRadius: BorderRadius.circular(Dimens.RADIUS_5),
          ),
          alignment: Alignment.center,
          child: Text(
            (i + 1).toString(),
            style: TxtStyle.p.copyWith(
              color:
                  state.userChooise[i] == -1 ? Colors.black : AppColors.white,
            ),
          ),
        );
      },
    );
  }
}
