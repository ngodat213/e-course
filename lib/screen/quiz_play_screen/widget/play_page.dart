import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/cubit/quiz_play_cubit.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/bottom_button.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/commit_buttom.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/current_question.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/option_widget.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/question_title.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/time_remaining.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({
    super.key,
    required this.userChooise,
  });

  final List<int> userChooise;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        CurrentQuestion(
                          current: state.index + 1,
                          maxCurrent: state.questions.length,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: Dimens.HEIGHT_10,
                          color: const Color.fromARGB(255, 2, 9, 61),
                        ),
                        const SizedBox(height: Dimens.HEIGHT_18),
                        TimeRemaining(title: '30m ${S.of(context).remaining}'),
                        const QuestionTitle(),
                        OptionWidget(userChooise: userChooise)
                      ],
                    ),
                  ),
                  const CommitButton(),
                  const BottomButton()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
