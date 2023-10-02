import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/comment.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/models/course_video.dart';
import 'package:quiz_flutter/models/custom_error.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

part 'course_video_state.dart';

class CourseVideoCubit extends Cubit<CourseVideoState> {
  final AppRepository _appRepository;
  CourseVideoCubit(this._appRepository) : super(CourseVideoState.initial());

  void videoChanged(CourseVideo value) {
    emit(
      state.copyWith(
        video: value,
        status: VideoStatus.isLoading,
      ),
    );
  }

  void selectionChanged(String value) {
    emit(
      state.copyWith(
        section: value,
        status: VideoStatus.isLoading,
      ),
    );
  }

  void courseChanged(Course value) {
    emit(
      state.copyWith(
        course: value,
        status: VideoStatus.isLoading,
      ),
    );
  }

  void commentChanged(String value) {
    emit(
      state.copyWith(
        comment: value,
        status: VideoStatus.isLoading,
      ),
    );
  }

  Future<void> sendCommnet() async {
    emit(state.copyWith(commentStatus: CommentStatus.isLoading));
    if (state.comment != "") {
      try {
        await _appRepository.setCommentCollection(
          videoId: state.video.uid,
          title: state.comment,
        );
        print("send oke");
        toastInfo(msg: 'Send oke!');
        emit(state.copyWith(commentStatus: CommentStatus.success));
      } on CustomError {
        emit(state.copyWith(commentStatus: CommentStatus.error));
      } catch (e) {
        emit(state.copyWith(commentStatus: CommentStatus.error));
      }
    } else {
      toastInfo(msg: "Fill in all text fields");
      emit(state.copyWith(commentStatus: CommentStatus.error));
    }
  }

  late var comments;
  Future<void> getCommnet() async {
    emit(state.copyWith(status: VideoStatus.isLoading));
    try {
      comments = await _appRepository.getComment();
      emit(state.copyWith(comments: comments, status: VideoStatus.isNotEmpty));
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception getCommnet',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
