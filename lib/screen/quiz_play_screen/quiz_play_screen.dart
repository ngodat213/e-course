import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/cubit/quiz_play_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/back_button.dart';

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
    return Scaffold(
      body: BlocBuilder<QuizPlayCubit, QuizPlayState>(
        builder: (context, state) {
          List<Question> question = state.questions;
          var lesson = state.lesson;
          if (state.status == QuestionStatus.isNotEmpty) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          CurrentQuestion(question: question),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 10,
                            color: const Color.fromARGB(255, 2, 9, 61),
                          ),
                          const SizedBox(height: 18),
                          const Text('30m Remaining'),
                          QuestionTitle(question: question),
                          ListQuestion(question: question)
                        ],
                      ),
                    ),
                    BuildBackButton(top: 10, left: 10),
                    Positioned(
                      right: 0,
                      top: 70,
                      child: GestureDetector(
                        onTap: () {},
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
                    ),
                    Positioned(
                      bottom: 50,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        width: MediaQuery.of(context).size.width - 50,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _btnPrevQuestion(),
                            _btnNextQuestion(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class CurrentQuestion extends StatelessWidget {
  const CurrentQuestion({
    super.key,
    required this.question,
  });

  final List<Question> question;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        var index = state.index;
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: const BoxDecoration(color: AppColors.main),
          child: Center(
            child:
                Text('Question $index/${question.length}', style: TxtStyle.p),
          ),
        );
      },
    );
  }
}

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({
    super.key,
    required this.question,
  });

  final List<Question> question;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        var index = state.index;
        return Container(
          margin: const EdgeInsets.all(25),
          child: Text(
            question[index].question,
            style: TxtStyle.text,
          ),
        );
      },
    );
  }
}

class ListQuestion extends StatelessWidget {
  const ListQuestion({
    super.key,
    required this.question,
  });

  final List<Question> question;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        var indexQuestion = state.index;
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: question[indexQuestion].options.length,
          itemBuilder: (context, index) {
            return BuildOptionQuiz(
              isSellect: true,
              option: question[indexQuestion].options[index],
            );
          },
        );
      },
    );
  }
}

class _btnNextQuestion extends StatelessWidget {
  const _btnNextQuestion();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        var index = state.index;
        return GestureDetector(
          onTap: () {
            context.read<QuizPlayCubit>().indexChanged(index + 1);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
            ),
            height: 50,
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Prev',
                  style: TxtStyle.buttonWhite,
                ),
                const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _btnPrevQuestion extends StatelessWidget {
  const _btnPrevQuestion();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPlayCubit, QuizPlayState>(
      builder: (context, state) {
        var index = state.index;
        return GestureDetector(
          onTap: () {
            context.read<QuizPlayCubit>().indexChanged(index + 1);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
            ),
            height: 50,
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: AppColors.white,
                ),
                Text(
                  'Prev',
                  style: TxtStyle.buttonWhite,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BuildOptionQuiz extends StatelessWidget {
  BuildOptionQuiz({
    required this.option,
    this.isSellect,
    super.key,
  });
  bool? isSellect = false;
  final String option;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
