import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/cubit/quiz_play_cubit.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/bottom_button.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/current_question.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/option_widget.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/question_title.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/widget/time_remaining.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class CheckResultPage extends StatelessWidget {
  const CheckResultPage({
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
                          height: 10,
                          color: const Color.fromARGB(255, 2, 9, 61),
                        ),
                        const SizedBox(height: 18),
                        const TimeRemaining(title: "Result"),
                        const QuestionTitle(),
                        OptionWidget(userChooise: userChooise)
                      ],
                    ),
                  ),
                  _HomeButton(
                    onTap: () {
                      context.read<QuizPlayCubit>().goHome();
                      BaseNavigation.push(context,
                          routeName: ManagerRoutes.mainScreen,
                          clearStack: true);
                    },
                  ),
                  const BottomButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HomeButton extends StatelessWidget {
  const _HomeButton({
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            boxShadow: AppColors.shadow,
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.logout_outlined),
        ),
      ),
    );
  }
}
