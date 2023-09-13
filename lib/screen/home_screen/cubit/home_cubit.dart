import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AppRepository appRepository;
  HomeCubit({required this.appRepository}) : super(HomeState.initial());

  late var quizs;
  void getQuiz() async {
    emit(state.copyWith(status: HomeStatus.isLoading));
    try {
      quizs = await appRepository.getQuizByLimit(5);
      emit(state.copyWith(quizs: quizs, status: HomeStatus.isNotEmpty));
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  late var courses;
  void getCourse() async {
    emit(state.copyWith(status: HomeStatus.isLoading));
    try {
      courses = await appRepository.getCourseByLimit(4);
      emit(state.copyWith(courses: courses, status: HomeStatus.isNotEmpty));
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
