import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/models/custom_error.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';

part 'course_list_screen_state.dart';

class CourseListScreenCubit extends Cubit<CourseListScreenState> {
  final AppRepository _appRepository;
  CourseListScreenCubit(
    this._appRepository,
  ) : super(CourseListScreenState.initial());

  late var courses;
  void getCourse() async {
    emit(state.copyWith(status: CourseListScreenStatus.isLoading));
    try {
      List<Course> res = [];
      res = await _appRepository.getCourse();
      courses = res;
      emit(state.copyWith(
          courses: courses, status: CourseListScreenStatus.isNotEmpty));
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
