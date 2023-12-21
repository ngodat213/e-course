import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/models/custom_error.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';
import 'package:quiz_flutter/repo/user_repository/user_repository.dart';

part 'course_screen_state.dart';

class CourseScreenCubit extends Cubit<CourseScreenState> {
  final AppRepository _appRepository;
  final UserRepository _userRepository;
  CourseScreenCubit(
    this._appRepository,
    this._userRepository,
  ) : super(CourseScreenState.initial());

  late var courses;
  void handleGetCourse() async {
    emit(state.copyWith(status: CourseScreenStatus.isLoading));
    try {
      List<Course> res = [];
      List<String> course = await _userRepository.getCourseUser();
      for (String i in course) {
        res.add(await _appRepository.getCourseById(i));
      }
      courses = res;
      emit(state.copyWith(
          courses: courses, status: CourseScreenStatus.isNotEmpty));
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
