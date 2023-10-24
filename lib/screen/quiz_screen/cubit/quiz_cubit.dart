import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final AppRepository appRepository;
  QuizCubit(this.appRepository) : super(QuizState.initial());

  void quizChanged(Quiz quiz) {
    emit(
      state.copyWith(
        quiz: quiz,
        status: QuizStatus.isLoading,
      ),
    );
  }

  List<QuizLesson>? lesson;
  void getLesson() async {
    try {
      List<QuizLesson> lessons = [];
      for (var element in state.quiz.lessons) {
        lessons.add(await appRepository.getLessonById(element));
      }
      if (lessons.isNotEmpty) {
        lesson = lessons;
      }
      emit(state.copyWith(lessons: lesson, status: QuizStatus.isNotEmpty));
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception QuizCubit',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
