part of 'course_video_cubit.dart';

enum CourseVideoStatus { isEmpty, isLoading, isNotEmpty }

class CourseVideoState extends Equatable {
  const CourseVideoState({
    required this.videoUrl,
    required this.course,
    required this.status,
  });
  final String videoUrl;
  final Course course;
  final CourseVideoStatus status;

  CourseVideoState copyWith({
    String? videoUrl,
    Course? course,
    CourseVideoStatus? status,
  }) {
    return CourseVideoState(
      videoUrl: videoUrl ?? this.videoUrl,
      course: course ?? this.course,
      status: status ?? this.status,
    );
  }

  factory CourseVideoState.initial() {
    return CourseVideoState(
      videoUrl: "",
      course: Course.initialCourse(),
      status: CourseVideoStatus.isLoading,
    );
  }

  @override
  List<Object> get props => [videoUrl, status];
}
