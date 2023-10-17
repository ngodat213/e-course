import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/cubit/quiz_play_cubit.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/bottom_button.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/commit_buttom.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/current_question.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/option_widget.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/question_title.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/time_remaining.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({
    super.key,
    required this.userChooise,
  });

  final List<int> userChooise;

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  late QuizLesson lesson;
  Duration duration = const Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    lesson = context.read<QuizPlayCubit>().state.lesson;
    duration = Duration(
        hours: lesson.hour, minutes: lesson.minute, seconds: lesson.second);
    startTimer();
  }

  void addTime() {
    setState(() {
      final second = duration.inSeconds - 1;
      if (second < 0) {
        context.read<QuizPlayCubit>().commit();
      } else {
        duration = Duration(seconds: second);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => addTime());
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hour = duration.inHours.remainder(60);
    final min = twoDigits(duration.inMinutes.remainder(60));
    final sec = twoDigits(duration.inSeconds.remainder(60));
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: const BottomButton(),
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  SizedBox(
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
                        TimeRemaining(
                            title:
                                '${hour}h ${min}m ${sec}s ${S.of(context).remaining}'),
                        const QuestionTitle(),
                        OptionWidget(userChooise: widget.userChooise)
                      ],
                    ),
                  ),
                  const CommitButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
