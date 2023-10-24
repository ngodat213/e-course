import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/cubit/quiz_play_cubit.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/check_result_page.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/commit_page.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/play_page.dart';

class QuizPlayScreen extends StatefulWidget {
  const QuizPlayScreen({super.key});

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QuizPlayCubit>().getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        List<int> userChooise = state.userChooise;
        if (state.status == QuestionStatus.isNotEmpty) {
          return PlayPage(userChooise: userChooise);
        } else if (state.status == QuestionStatus.commit) {
          return const CommitPage();
        } else if (state.status == QuestionStatus.result) {
          return CheckResultPage(userChooise: userChooise);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
