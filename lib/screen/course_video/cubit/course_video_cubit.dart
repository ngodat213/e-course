import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/course.dart';

part 'course_video_state.dart';

class CourseVideoCubit extends Cubit<CourseVideoState> {
  CourseVideoCubit() : super(CourseVideoState.initial());

  void videoUrlChanged(String value) {
    emit(
      state.copyWith(
        videoUrl: value,
        status: CourseVideoStatus.isLoading,
      ),
    );
  }

  void selectionChanged(String value) {
    emit(
      state.copyWith(
        section: value,
        status: CourseVideoStatus.isLoading,
      ),
    );
  }

  void titleChanged(String value) {
    emit(
      state.copyWith(
        title: value,
        status: CourseVideoStatus.isLoading,
      ),
    );
  }

  void courseChanged(Course value) {
    emit(
      state.copyWith(
        course: value,
        status: CourseVideoStatus.isLoading,
      ),
    );
  }

  void commentChanged(Course value) {
    emit(
      state.copyWith(
        course: value,
        status: CourseVideoStatus.isLoading,
      ),
    );
  }
}
