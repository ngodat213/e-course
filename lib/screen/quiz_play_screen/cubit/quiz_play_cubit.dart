import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';

part 'quiz_play_state.dart';

class QuizPlayCubit extends Cubit<QuizPlayState> {
  final AppRepository appRepository;
  QuizPlayCubit(this.appRepository) : super(QuizPlayState.initial());

  List<Question>? questions;
  void getQuestion() async {
    try {
      List<Question> lessonData = [];
      for (var element in state.lesson.questions) {
        lessonData.add(await appRepository.getQuestionById(element));
      }
      if (lessonData.isNotEmpty) {
        questions = lessonData;
      }
      emit(state.copyWith(
          questions: questions, status: QuestionStatus.isNotEmpty));
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
