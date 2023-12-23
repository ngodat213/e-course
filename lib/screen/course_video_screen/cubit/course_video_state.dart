part of 'course_video_cubit.dart';

enum VideoStatus { isEmpty, isLoading, isNotEmpty }

enum CommentStatus { success, error, isLoading }

class CourseVideoState extends Equatable {
  const CourseVideoState({
    required this.video,
    required this.selection,
    required this.course,
    required this.status,
    required this.comment,
    required this.comments,
    required this.commentStatus,
  });
  final CourseVideo video;
  final String selection;
  final Course course;
  final VideoStatus status;
  final String comment;
  final List<Comment> comments;
  final CommentStatus commentStatus;

  CourseVideoState copyWith(
      {CourseVideo? video,
      String? selection,
      String? comment,
      Course? course,
      VideoStatus? status,
      List<Comment>? comments,
      CommentStatus? commentStatus}) {
    return CourseVideoState(
      video: video ?? this.video,
      selection: selection ?? this.selection,
      course: course ?? this.course,
      status: status ?? this.status,
      comment: comment ?? this.comment,
      comments: comments ?? this.comments,
      commentStatus: commentStatus ?? this.commentStatus,
    );
  }

  factory CourseVideoState.initial() {
    return CourseVideoState(
        video: CourseVideo.initialCourseVideo(),
        selection: "",
        comment: "",
        comments: const [],
        course: Course.initialCourse(),
        status: VideoStatus.isLoading,
        commentStatus: CommentStatus.isLoading);
  }

  @override
  List<Object> get props =>
      [video, selection, status, comment, comments, commentStatus];
}
