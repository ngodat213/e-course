import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';

part 'quiz_play_state.dart';

class QuizPlayCubit extends Cubit<QuizPlayState> {
  final AppRepository appRepository;
  QuizPlayCubit(this.appRepository) : super(QuizPlayState.initial());

  void lessonChanged(QuizLesson lesson) {
    emit(
      state.copyWith(
        lesson: lesson,
        status: QuestionStatus.isLoading,
      ),
    );
  }

  void nextChanged() {
    if (state.index < state.questions.length - 1) {
      emit(
        state.copyWith(index: state.index + 1),
      );
    }
  }

  void prevChanged() {
    if (state.index > 0) {
      emit(
        state.copyWith(index: state.index - 1),
      );
    }
  }

  void indexChanged(int index) {
    emit(
      state.copyWith(index: index),
    );
  }

  void optionChanged(List<int> userChooise) {
    emit(
      state.copyWith(userChooise: userChooise),
    );
  }

  void commit() {
    emit(
      state.copyWith(status: QuestionStatus.isLoading),
    );
    List<int> res = state.userChooise;
    int userCorrect = 0;
    for (int i = 0; i < state.questions.length; i++) {
      if (res[i] == questions![i].answer) {
        res[i] = 5;
        userCorrect++;
      }
    }
    emit(
      state.copyWith(
        index: 0,
        userChooise: res,
        userCorrect: userCorrect,
        status: QuestionStatus.commit,
      ),
    );
  }

  void checkResult() {
    emit(
      state.copyWith(
        status: QuestionStatus.result,
      ),
    );
  }

  void goHome() {
    emit(
      state.copyWith(
        lesson: QuizLesson.initialQuiz(),
        index: 0,
        questions: const [],
        userChooise: const [],
        userCorrect: 0,
        status: QuestionStatus.isLoading,
      ),
    );
  }

  List<Question>? questions;
  void getQuestion() async {
    try {
      List<Question> questionData = [];
      for (var element in state.lesson.questions) {
        questionData.add(await appRepository.getQuestionById(element));
      }
      if (questionData.isNotEmpty) {
        questions = questionData;
      }
      print("cubit quiz: $questions");
      emit(
        state.copyWith(
            questions: questions,
            userChooise: List.filled(questionData.length, -1),
            status: QuestionStatus.isNotEmpty),
      );
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
