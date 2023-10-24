import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/models/custom_error.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';
import 'package:quiz_flutter/repo/user_repository/user_repository.dart';

part 'favorite_screen_state.dart';

class FavoriteScreenCubit extends Cubit<FavoriteScreenState> {
  final AppRepository _appRepository;
  final UserRepository _userRepository;
  FavoriteScreenCubit(
    this._appRepository,
    this._userRepository,
  ) : super(FavoriteScreenState.initial());

  late var courses;
  void getFavoriteCourse() async {
    emit(state.copyWith(status: FavoriteScreenStatus.isLoading));
    try {
      List<Course> res = [];
      List<String> course = await _userRepository.getFavoriteCourseUser();
      for (String i in course) {
        res.add(await _appRepository.getCourseById(i));
      }
      courses = res;
      emit(state.copyWith(
          courses: courses, status: FavoriteScreenStatus.isNotEmpty));
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
