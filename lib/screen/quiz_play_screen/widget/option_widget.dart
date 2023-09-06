import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/cubit/quiz_play_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class OptionWidget extends StatefulWidget {
  const OptionWidget({
    super.key,
    required this.userChooise,
  });
  final List<int> userChooise;

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        if (state.status == QuestionStatus.isNotEmpty) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.questions[state.index].options.length,
            itemBuilder: (context, index) {
              return _OptionChooice(
                onTap: () {
                  setState(() {
                    widget.userChooise[state.index] = index;
                  });
                  context
                      .read<QuizPlayCubit>()
                      .optionChanged(widget.userChooise);
                },
                isSellect: index == state.userChooise[state.index],
                option: state.questions[state.index].options[index],
              );
            },
          );
        } else if (state.status == QuestionStatus.result) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.questions[state.index].options.length,
            itemBuilder: (context, index) {
              int chooice = 0;
              if (state.userChooise[state.index] != -1) {
                if (state.userChooise[state.index] == 5 &&
                    state.questions[state.index].answer == index) {
                  chooice = 1;
                } else if (state.userChooise[state.index] != 5) {
                  if (state.questions[state.index].answer == index) {
                    chooice = 1;
                  } else if (state.userChooise[state.index] == index) {
                    chooice = 2;
                  }
                }
              } else if (state.questions[state.index].answer == index) {
                chooice = -1;
              }

              return _OptionResult(
                option: state.questions[state.index].options[index],
                chooice: chooice,
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _OptionChooice extends StatelessWidget {
  _OptionChooice({
    required this.option,
    this.isSellect,
    this.onTap,
  });
  final String option;
  bool? isSellect = false;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: AppColors.shadow,
          borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
          color: isSellect == true ? AppColors.main : AppColors.white,
        ),
        child: Row(
          children: [
            isSellect == true
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: AppColors.white),
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.colorBlue,
                      borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
                    ),
                  ),
            Text(
              option,
              style: isSellect == true ? TxtStyle.p : TxtStyle.text,
            )
          ],
        ),
      ),
    );
  }
}

class _OptionResult extends StatelessWidget {
  const _OptionResult({
    required this.option,
    required this.chooice,
  });
  final String option;
  final int chooice;

  @override
  Widget build(BuildContext context) {
    final Color color;
    if (chooice == 1) {
      color = Colors.green;
    } else if (chooice == -1) {
      color = AppColors.main;
    } else if (chooice == 2) {
      color = Colors.red;
    } else {
      color = AppColors.colorBlue;
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: AppColors.shadow,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: AppColors.white),
              color: color,
              borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
            ),
          ),
          Text(option, style: TxtStyle.text)
        ],
      ),
    );
  }
}
