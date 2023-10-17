import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/models/quiz.dart';
import 'package:quiz_flutter/models/quiz_lesson.dart';
import 'package:quiz_flutter/screen/quiz_play_screen/cubit/quiz_play_cubit.dart';
import 'package:quiz_flutter/screen/quiz_screen/cubit/quiz_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';
import 'package:readmore/readmore.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QuizCubit>().getLesson();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        var quiz = state.quiz;
        var lesson = state.lessons;
        if (state.status == QuizStatus.isNotEmpty) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 70),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width - 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(quiz.image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.circular(Dimens.RADIUS_8),
                            ),
                          ),
                          BuildContent(quiz: quiz, lesson: lesson),
                        ],
                      ),
                    ),
                    TitleScreen(title: quiz.title),
                    BuildBackButton(top: 24),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class BuildContent extends StatelessWidget {
  const BuildContent({
    super.key,
    required this.quiz,
    required this.lesson,
  });

  final Quiz quiz;
  final List<QuizLesson> lesson;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Dimens.RADIUS_8),
            Text(quiz.title, style: TxtStyle.h2),
            const SizedBox(height: Dimens.HEIGHT_6),
            Row(
              children: [
                Text(
                  "@mftmkkus",
                  style:
                      TxtStyle.pBold.copyWith(color: const Color(0xFF93989A)),
                ),
                const SizedBox(width: 4),
                SvgPicture.asset(Images.iconCheckMark),
              ],
            ),
            const SizedBox(height: Dimens.HEIGHT_16),
            ReadMoreText(
              quiz.description,
              trimLines: 2,
              style: TxtStyle.text.copyWith(color: const Color(0xFF93989A)),
            ),
            const SizedBox(height: 32),
            Text('Lessons', style: TxtStyle.title),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: lesson.length,
              itemBuilder: (context, index) {
                return _lessonQuiz(lesson: lesson[index]);
              },
            ),
            const SizedBox(height: 50)
          ],
        ),
      ],
    );
  }
}

class _lessonQuiz extends StatelessWidget {
  const _lessonQuiz({
    required this.lesson,
  });

  final QuizLesson lesson;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<QuizPlayCubit>().lessonChanged(lesson);
        BaseNavigation.push(context, routeName: ManagerRoutes.quizPlayScreen);
      },
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
            boxShadow: AppColors.shadow,
            color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.main,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lesson.title, style: TxtStyle.text),
                  Expanded(child: Container()),
                  Text('${lesson.hour}h ${lesson.minute}m ${lesson.second}s',
                      style: TxtStyle.labelStyle),
                ],
              ),
              Expanded(child: Container()),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
                  color: AppColors.grey,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Center(
                      child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: AppColors.main,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
