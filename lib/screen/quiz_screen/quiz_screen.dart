import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/models/quiz.dart';
import 'package:quiz_flutter/models/quiz_lesson.dart';
import 'package:quiz_flutter/screen/quiz_screen/cubit/quiz_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/back_button.dart';

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
    return Scaffold(
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          var quiz = state.quiz;
          var lesson = state.lessons;
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    expandedHeight: 230,
                    elevation: 0,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(0),
                      child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimens.RADIUS_8),
                            topLeft: Radius.circular(Dimens.RADIUS_8),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 30,
                            height: 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.main),
                          ),
                        ),
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: quiz.image == ''
                          ? Container(
                              height: 230,
                              width: MediaQuery.of(context).size.width,
                              color: AppColors.main,
                            )
                          : Container(
                              height: 230,
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  BoxDecoration(boxShadow: AppColors.shadow),
                              child: Image.network(
                                quiz.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BuildContent(quiz: quiz, lesson: lesson),
                  )
                ],
              ),
              BuildBackButton(),
            ],
          );
        },
      ),
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(quiz.title, style: TxtStyle.h2),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(right: 8),
                  child: const CircleAvatar(
                      backgroundImage: NetworkImage(DEFAULT_AVATAR))),
              Text('HydraCoder', style: TxtStyle.labelStyle),
            ],
          ),
          const SizedBox(height: 16),
          Text('Overview', style: TxtStyle.title),
          const SizedBox(height: 6),
          Text(quiz.description),
          const SizedBox(height: 16),
          Text('Lessons', style: TxtStyle.title),
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
                  Text('${lesson.minute} Minutes', style: TxtStyle.labelStyle),
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
