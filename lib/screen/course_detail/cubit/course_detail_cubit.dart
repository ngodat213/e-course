import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/models/course_lesson.dart';
import 'package:quiz_flutter/models/course_video.dart';
import 'package:quiz_flutter/models/custom_error.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';
import 'package:quiz_flutter/repo/user_repository/user_repository.dart';

part 'course_detail_state.dart';

class CourseDetailCubit extends Cubit<CourseDetailState> {
  final AppRepository _appRepository;
  final UserRepository _userRepository;

  CourseDetailCubit(this._appRepository, this._userRepository)
      : super(CourseDetailState.initial());

  void courseChanged(Course course) {
    emit(
      state.copyWith(
        course: course,
        status: CourseDetail.isNotEmpty,
      ),
    );
  }

  void videoChanged(String video) {
    emit(
      state.copyWith(
        video: video,
        status: CourseDetail.isNotEmpty,
      ),
    );
  }

  void isFullChanged(bool isFull) {
    emit(
      state.copyWith(
        isFull: isFull,
        status: CourseDetail.isNotEmpty,
      ),
    );
  }

  List<CourseVideo>? listVideo;
  List<CourseLesson>? lesson;
  void getCourseLesson() async {
    emit(state.copyWith(status: CourseDetail.isLoading));
    try {
      List<CourseLesson> lessons = [];
      List<CourseVideo> videos = [];
      for (var element in state.course.listLesson) {
        lessons.add(await _appRepository.getCourseLessonById(element));
      }
      if (lessons.isNotEmpty) {
        lesson = lessons;
        emit(state.copyWith(
            courseLesson: lesson, status: CourseDetail.isNotEmpty));
      }
      for (var element in state.courseLesson) {
        for (var i in element.listCourseVideo) {
          videos.add(await _appRepository.getCourseVideoById(i));
        }
      }
      if (videos.isNotEmpty) {
        listVideo = videos;
        emit(state.copyWith(
            courseVideo: listVideo,
            video: listVideo![0].video,
            status: CourseDetail.isNotEmpty));
      }
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

  Future<void> updateCourse() async {
    if (state.status == CourseDetail.isLoading) return;
    try {
      await _userRepository.setCourse(state.course.uid);
      emit(state.copyWith(status: CourseDetail.isNotEmpty));
    } on CustomError catch (e) {
      throw CustomError(code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception Set course',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
