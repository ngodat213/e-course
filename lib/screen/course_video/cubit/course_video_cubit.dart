import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_flutter/models/comment.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/models/course_video.dart';
import 'package:quiz_flutter/models/custom_error.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';
import 'package:quiz_flutter/repo/user_repository/user_repository.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

part 'course_video_state.dart';

class CourseVideoCubit extends Cubit<CourseVideoState> {
  final AppRepository _appRepository;
  final UserRepository _userRepository;
  CourseVideoCubit(this._appRepository, this._userRepository)
      : super(CourseVideoState.initial());

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
        selection: value,
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
        status: VideoStatus.isNotEmpty,
        commentStatus: CommentStatus.isLoading,
      ),
    );
  }

  Future<String?> getPhotoUrlById(String id) async {
    return await _userRepository.getPhotoUrlByUID(id);
  }

  Future<String?> getUsernameById(String id) async {
    return await _userRepository.getNameUserByUID(id);
  }

  Future<void> sendCommnet() async {
    emit(state.copyWith(commentStatus: CommentStatus.isLoading));
    if (state.comment != "") {
      try {
        await _appRepository.setCommentCollection(
          videoId: state.video.uid,
          title: state.comment,
        );
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
  void getComment() async {
    emit(state.copyWith(status: VideoStatus.isLoading));
    try {
      List<Comment> res = [];
      List<String> course =
          await _appRepository.getCommentVideo(state.video.uid);
      for (String i in course) {
        res.add(await _appRepository.getCommentById(i));
      }
      comments = res;
      emit(state.copyWith(comments: comments, status: VideoStatus.isNotEmpty));
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
