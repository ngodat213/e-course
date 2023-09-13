import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/models/course_lesson.dart';
import 'package:quiz_flutter/models/course_video.dart';
import 'package:quiz_flutter/models/custom_error.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';

part 'course_detail_state.dart';

class CourseDetailCubit extends Cubit<CourseDetailState> {
  final AppRepository appRepository;

  CourseDetailCubit(this.appRepository) : super(CourseDetailState.initial());

  void courseChanged(Course course) {
    emit(
      state.copyWith(
        course: course,
        status: CourseDetail.isNotEmpty,
      ),
    );
  }

  List<CourseVideo>? video;
  void getCourseVideo() async {
    emit(state.copyWith(status: CourseDetail.isLoading));
    try {
      List<CourseVideo> videos = [];
      for (var element in state.courseLesson) {
        for (var i in element.listCourseVideo) {
          videos.add(await appRepository.getCourseVideoById(i));
        }
      }
      if (videos.isNotEmpty) {
        video = videos;
      }
      emit(state.copyWith(courseVideo: video, status: CourseDetail.isNotEmpty));
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

  List<CourseLesson>? lesson;
  void getCourseLesson() async {
    emit(state.copyWith(status: CourseDetail.isLoading));
    try {
      List<CourseLesson> lessons = [];
      for (var element in state.course.listLesson) {
        lessons.add(await appRepository.getCourseLessonById(element));
      }
      if (lessons.isNotEmpty) {
        lesson = lessons;
      }
      emit(state.copyWith(
          courseLesson: lesson, status: CourseDetail.isNotEmpty));
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
