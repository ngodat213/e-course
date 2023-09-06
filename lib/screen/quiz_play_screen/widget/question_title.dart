import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/cubit/quiz_play_cubit.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(25),
          child: Text(
            state.questions[state.index].question,
            style: TxtStyle.text,
          ),
        );
      },
    );
  }
}
